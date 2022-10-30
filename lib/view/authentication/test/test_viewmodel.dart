import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';

part 'test_viewmodel.g.dart';

// ignore: library_private_types_in_public_api
class TestViewModel = _TestViewModelBase with _$TestViewModel, BaseViewModel;

abstract class _TestViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => ctx = context;

  @override
  void init() {}

  @observable
  int counter = 0;

  @observable
  String? locale;

  @action
  void increment() {
    counter++;
  }
}
