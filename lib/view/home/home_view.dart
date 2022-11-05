import 'package:cf8tpr1nt/core/extensions/context_extensions.dart';
import 'package:cf8tpr1nt/feature/enums/home_navbar.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  List<Widget> _buildScreens() {
    return NavbarTab.values.map((e) => e.page).toList();
  }

  List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) {
    return NavbarTab.values
        .map(
          (e) => PersistentBottomNavBarItem(
            icon: Icon(e.icon),
            title: e.name,
            activeColorPrimary: context.colors.primary,
            inactiveColorPrimary: context.colors.outline,
            textStyle: context.textTheme.bodyText1,
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    PersistentTabController controller;

    controller = PersistentTabController();

    return PersistentTabView(
      context,
      controller: controller,
      screens: _buildScreens(),
      items: _navBarsItems(context),
      resizeToAvoidBottomInset: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10),
        colorBehindNavBar: Colors.white,
      ),
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
      ),
      navBarStyle: NavBarStyle.style9,
    );
  }
}
