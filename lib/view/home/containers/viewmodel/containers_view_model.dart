import 'package:cf8tpr1nt/core/base/model/base_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'containers_view_model.g.dart';

class ContainersViewModel = _ContainersViewModelBase with _$ContainersViewModel;

abstract class _ContainersViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => ctx = context;

  @override
  void init() {}

  @override
  void dispose() {}
}
