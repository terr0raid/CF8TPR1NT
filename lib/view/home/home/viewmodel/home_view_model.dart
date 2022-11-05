import 'package:auto_route/auto_route.dart';
import 'package:cf8tpr1nt/core/base/model/base_view_model.dart';
import 'package:cf8tpr1nt/core/extensions/context_extensions.dart';
import 'package:cf8tpr1nt/feature/enums/home_navbar.dart';
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
  void init() {}

  @override
  void dispose() {}

  List<PageRouteInfo> get buildRoutes {
    return NavbarTab.values.map((e) => e.routes).toList();
  }

  List<Widget> get screens {
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
