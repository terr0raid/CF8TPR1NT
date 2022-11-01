import 'package:cf8tpr1nt/core/base/model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'test_viewmodel.g.dart';

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
