import 'package:cf8tpr1nt/core/base/model/base_view_model.dart';
import 'package:cf8tpr1nt/core/init/firebase/firebase_service.dart';
import 'package:cf8tpr1nt/view/home/rewards/model/reward_model.dart';
import 'package:cf8tpr1nt/view/home/rewards/rewards_detail/service/rewards_detail_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'rewards_detail_view_model.g.dart';

class RewardsDetailViewModel = _RewardsDetailViewModelBase
    with _$RewardsDetailViewModel;

abstract class _RewardsDetailViewModelBase with Store, BaseViewModel {
  RewardsDetailService service =
      RewardsDetailService(FirebaseService.instance.firestore);
  RewardModel? get reward => navigation.getRouteArgs<RewardModel>(ctx)!;

  @observable
  int? userPoint;

  @observable
  bool isLoading = false;

  @computed
  bool get isEnoughPoints {
    if (userPoint == null || reward == null) return false;
    return userPoint! >= reward!.points!;
  }

  @computed
  int get remainingPoints {
    if (userPoint == null || reward == null) return 0;
    return userPoint! - reward!.points!;
  }

  @override
  void setContext(BuildContext context) => ctx = context;

  @override
  void init() {
    getUserPoint();
  }

  @override
  void dispose() {}

  @action
  Future<void> getUserPoint() async {
    changeLoading();
    userPoint = await service.getUserPoint(
      firebaseService.auth.currentUser!.uid,
    );
    changeLoading();
  }

  @action
  Future<void> claimReward() async {
    // changeLoading();
    // await service.claimReward(
    //   firebaseService.auth.currentUser!.uid,
    //   reward!,
    // );
    // changeLoading();
  }

  @action
  void changeLoading() => isLoading = !isLoading;
}
