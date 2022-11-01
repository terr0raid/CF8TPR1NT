// ignore_for_file: library_private_types_in_public_api

import 'package:cf8tpr1nt/core/base/model/base_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => ctx = context;
  @override
  void init() {}

  @action
  Future<void> navigateToHome() async {
    // await navigationService.navigateToPage(path: '/home');
  }
}
