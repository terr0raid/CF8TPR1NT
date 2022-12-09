import 'package:cf8tpr1nt/core/base/model/base_view_model.dart';
import 'package:cf8tpr1nt/feature/model/user_model.dart';
import 'package:cf8tpr1nt/view/home/profile/service/profile_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'profile_view_model.g.dart';

class ProfileViewModel = _ProfileViewModelBase with _$ProfileViewModel;

abstract class _ProfileViewModelBase with Store, BaseViewModel {
  _ProfileViewModelBase(this.service);
  IProfileService service;

  @observable
  bool isLoading = false;

  @observable
  User? currentUser;

  @observable
  UserModel? user;

  @override
  void setContext(BuildContext context) => ctx = context;

  @override
  void init() {
    if (service.currentUser != null) {
      currentUser = service.currentUser;
      getUser(currentUser!.uid);
    } else {
      goBack();
    }
  }

  @override
  void dispose() {}

  @action
  Future<void> signOut() async {
    currentUser = null;
    await service.signOut();
  }

  @action
  Future<void> getUser(String uid) async {
    changeLoading();
    user = await service.getUser(uid);
    changeLoading();
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  // Future<void> navigateToRewards() async {
  //   await navigation.navigateToPage(path: NavigationConstants.REWARDS_VIEW);
  // }

  void goBack() {
    navigation.navigatePop();
  }
}
