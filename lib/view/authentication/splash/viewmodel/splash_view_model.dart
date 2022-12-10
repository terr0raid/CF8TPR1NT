import 'package:cf8tpr1nt/core/base/model/base_view_model.dart';
import 'package:cf8tpr1nt/core/constants/enums/preferences_keys.dart';
import 'package:cf8tpr1nt/feature/constants/navigation/navigation_constants.dart';
import 'package:cf8tpr1nt/view/authentication/splash/service/splash_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store, BaseViewModel {
  _SplashViewModelBase(this.splashService);

  ISplashService splashService;

  @observable
  bool isLoading = false;

  @override
  void setContext(BuildContext context) => ctx = context;

  @override
  void init() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controlAppState();
    });
  }

  @override
  void dispose() {}

  @action
  void _changeIsLoading() => isLoading = !isLoading;

  Future<void> controlAppState() async {
    await splashService.initiliazeDevice();
    _changeIsLoading();
    await _checkFirstInitiliaze();
    _changeIsLoading();
  }

  Future<void> _checkFirstInitiliaze() async {
    final isFirstApp = localeManager.getBoolValue(
      PreferencesKeys.IS_FIRST_APP,
    );
    if (isFirstApp == null || isFirstApp) {
      await navigation.navigateToPageClear(
        path: NavigationConstants.ON_BOARD_VIEW,
      );
    } else {
      _checkUserAuth();
    }
  }

  void _checkUserAuth() {
    final currentUser = splashService.getCurrentUser();
    if (currentUser != null) {
      navigation.navigateToPageClear(
        path: NavigationConstants.HOME_VIEW,
      );
    } else {
      navigation.navigateToPageClear(
        path: NavigationConstants.LOGIN_VIEW,
      );
    }
  }
}
