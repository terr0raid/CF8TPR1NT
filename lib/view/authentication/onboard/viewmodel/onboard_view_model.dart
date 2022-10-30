// ignore_for_file: library_private_types_in_public_api

import 'package:cf8tpr1nt/core/base/model/base_view_model.dart';
import 'package:cf8tpr1nt/core/constants/enums/preferences_keys.dart';
import 'package:cf8tpr1nt/core/constants/navigation/navigation_constants.dart';
import 'package:cf8tpr1nt/core/init/language/locale_keys.g.dart';
import 'package:cf8tpr1nt/feature/constants/image_paths.dart';
import 'package:cf8tpr1nt/view/authentication/onboard/model/on_board_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'onboard_view_model.g.dart';

class OnBoardViewModel = _OnBoardViewModelBase with _$OnBoardViewModel;

abstract class _OnBoardViewModelBase with Store, BaseViewModel {
  List<OnBoardModel> onBoardItems = [];

  @observable
  int currentIndex = 0;

  @observable
  bool isLoading = false;

  PageController pageController = PageController();

  @override
  void setContext(BuildContext context) => ctx = context;

  @override
  void init() {
    onBoardItems.addAll(
      [
        OnBoardModel(
          title: LocaleKeys.onBoard_page1_title.tr(),
          description: LocaleKeys.onBoard_page1_desc.tr(),
          image: ImagePaths.instance.welcome,
        ),
        OnBoardModel(
          title: LocaleKeys.onBoard_page2_title.tr(),
          description: LocaleKeys.onBoard_page2_desc.tr(),
          image: ImagePaths.instance.recycleBus,
        ),
        OnBoardModel(
          title: LocaleKeys.onBoard_page3_title.tr(),
          description: LocaleKeys.onBoard_page3_desc.tr(),
          image: ImagePaths.instance.usingPhone,
        ),
      ],
    );
  }

  @action
  void setCurrentIndex(int index) {
    currentIndex = index;
  }

  @action
  void nextPage() {
    if (currentIndex < onBoardItems.length - 1) {
      currentIndex++;
      pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      completeToOnBoard();
    }
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  Future<void> completeToOnBoard() async {
    changeLoading();
    await localeManager.setBoolValue(PreferencesKeys.IS_FIRST_APP, true);
    changeLoading();
    if (navigationService.navigatorKey.currentState!.canPop()) {
      navigationService.navigatorKey.currentState!.pop();
    } else {
      await navigationService.navigateToPageClear(
        path: NavigationConstants.LOGIN_VIEW,
      );
    }
  }
}
