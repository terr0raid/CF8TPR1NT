import 'package:cf8tpr1nt/core/base/model/base_view_model.dart';
import 'package:cf8tpr1nt/core/extensions/context_extensions.dart';
import 'package:cf8tpr1nt/feature/constants/navigation/navigation_constants.dart';
import 'package:cf8tpr1nt/feature/enums/home_navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store, BaseViewModel {
  _HomeViewModelBase();

  @override
  void setContext(BuildContext context) => ctx = context;

  @override
  void init() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user == null) {
        await navigation.navigateToPageClear(
          path: NavigationConstants.LOGIN_VIEW,
        );
      } else {
        // await navigation.navigateToPageClear(
        //   path: NavigationConstants.HOME_VIEW,
        // );
      }
    });
  }

  @override
  void dispose() {}

  List<Widget> get buildScreens {
    return NavbarTab.values.map((e) => e.page).toList();
  }

  List<PersistentBottomNavBarItem> get navBarItems {
    return NavbarTab.values
        .map(
          (e) => PersistentBottomNavBarItem(
            icon: Icon(e.icon),
            title: e.name,
            activeColorPrimary: ctx.colors.primary,
            inactiveColorPrimary: ctx.colors.outline,
            textStyle: ctx.textTheme.bodyText1,
          ),
        )
        .toList();
  }
}
