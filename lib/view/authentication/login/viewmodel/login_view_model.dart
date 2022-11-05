// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously, lines_longer_than_80_chars

import 'package:cf8tpr1nt/core/base/model/base_view_model.dart';
import 'package:cf8tpr1nt/core/constants/navigation/navigation_constants.dart';
import 'package:cf8tpr1nt/core/extensions/context_extensions.dart';
import 'package:cf8tpr1nt/core/init/language/locale_keys.g.dart';
import 'package:cf8tpr1nt/view/authentication/login/service/login_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store, BaseViewModel {
  _LoginViewModelBase(this.loginService);
  ILoginService loginService;

  @observable
  bool isGoogleLoading = false;
  @observable
  bool isFacebookLoading = false;

  @override
  void setContext(BuildContext context) => ctx = context;
  @override
  void init() {}
  @override
  void dispose() {}

  Future<void> googleSignIn() async {
    _changeGoogleLoading();
    await _checkNavigation();
    final response = await loginService.googleSignIn();
    _changeGoogleLoading();
    if (response is User) {
      await navigation.navigateToPageClear(
        path: NavigationConstants.HOME_VIEW,
      );
    } else {
      ctx.showSnackBar(LocaleKeys.auth_loginError.tr());
    }
  }

  Future<void> facebookSignIn() async {
    _changeFacebookLoading();
    await _checkNavigation();
    final response = await loginService.facebookSignIn();
    _changeFacebookLoading();
    if (response is User) {
      await navigation.navigateToPageClear(
        path: NavigationConstants.HOME_VIEW,
      );
    } else {
      ctx.showSnackBar(LocaleKeys.auth_loginError.tr());
    }
  }

  @action
  void _changeGoogleLoading() {
    isGoogleLoading = !isGoogleLoading;
  }

  @action
  void _changeFacebookLoading() {
    isFacebookLoading = !isFacebookLoading;
  }

  Future<void> _checkNavigation() async {
    final isUserLoggedIn = loginService.isUserLoggedIn();
    if (isUserLoggedIn) {
      ctx.showSnackBar(LocaleKeys.auth_alreadyLoggedIn.tr());
      if (navigation.navigatorKey.currentState!.canPop()) {
        navigation.navigatorKey.currentState!.pop();
      } else {
        await navigation.navigateToPageClear(
          path: NavigationConstants.HOME_VIEW,
        );
      }
    }
  }
}
