// ignore_for_file: library_private_types_in_public_api

import 'package:cf8tpr1nt/core/base/model/base_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'onboard_view_model.g.dart';

class OnBoardViewModel = _OnBoardViewModelBase with _$OnBoardViewModel;

abstract class _OnBoardViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => ctx = context;

  @override
  void init() {}
}
