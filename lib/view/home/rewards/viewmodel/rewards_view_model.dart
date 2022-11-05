import 'package:cf8tpr1nt/core/base/model/base_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'rewards_view_model.g.dart';

class RewardsViewModel = _RewardsViewModelBase with _$RewardsViewModel;

abstract class _RewardsViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => ctx = context;

  @override
  void init() {}

  @override
  void dispose() {}
}
