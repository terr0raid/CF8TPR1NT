// ignore_for_file: library_private_types_in_public_api

import 'package:cf8tpr1nt/core/base/model/base_view_model.dart';
import 'package:cf8tpr1nt/core/constants/enums/preferences_keys.dart';
import 'package:cf8tpr1nt/core/extensions/context_extensions.dart';
import 'package:cf8tpr1nt/core/init/language/locale_keys.g.dart';
import 'package:cf8tpr1nt/feature/constants/app/image_paths.dart';
import 'package:cf8tpr1nt/feature/constants/navigation/navigation_constants.dart';
import 'package:cf8tpr1nt/view/authentication/onboard/model/on_board_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'onboard_view_model.g.dart';

class OnBoardViewModel = _OnBoardViewModelBase with _$OnBoardViewModel;

abstract class _OnBoardViewModelBase with Store, BaseViewModel {
  _OnBoardViewModelBase(this.pageController);
  List<OnBoardModel> onBoardItems = [];
  PageController pageController;

  @observable
  int currentIndex = 0;

  @observable
  bool isLoading = false;

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

  @override
  void dispose() {}

  @action
  void setCurrentIndex(int index) => currentIndex = index;

  @action
  void nextPage() {
    if (currentIndex < onBoardItems.length - 1) {
      currentIndex++;
      pageController.animateToPage(
        currentIndex,
        duration: ctx.lowDuration,
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
    await localeManager.setBoolValue(
      PreferencesKeys.IS_FIRST_APP,
      value: false,
    );
    changeLoading();
    if (navigation.navigatorKey.currentState!.canPop()) {
      navigation.navigatorKey.currentState!.pop();
    } else {
      await navigation.navigateToPageClear(
        path: NavigationConstants.LOGIN_VIEW,
      );
    }
  }
}
