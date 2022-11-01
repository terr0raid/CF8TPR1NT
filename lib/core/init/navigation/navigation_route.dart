import 'package:cf8tpr1nt/core/base/widgets/not_found_navigation_widget.dart';
import 'package:cf8tpr1nt/core/constants/navigation/navigation_constants.dart';
import 'package:cf8tpr1nt/view/authentication/login/view/login_view.dart';
import 'package:cf8tpr1nt/view/authentication/test/test_view.dart';
import 'package:flutter/material.dart';

class NavigationRoute {
  NavigationRoute._init();
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT:
        return normalNavigate(const TestView(), NavigationConstants.DEFAULT);
      case NavigationConstants.LOGIN_VIEW:
        return normalNavigate(
          const LoginView(),
          NavigationConstants.LOGIN_VIEW,
        );
      case NavigationConstants.ABOUT_VIEW:
        return normalNavigate(
          const LoginView(),
          NavigationConstants.ABOUT_VIEW,
        );
      case NavigationConstants.HOME_VIEW:
        return normalNavigate(
          const LoginView(),
          NavigationConstants.HOME_VIEW,
        );
      case NavigationConstants.PROFILE_VIEW:
        return normalNavigate(
          const LoginView(),
          NavigationConstants.PROFILE_VIEW,
        );
      case NavigationConstants.REGISTER_VIEW:
        return normalNavigate(
          const LoginView(),
          NavigationConstants.REGISTER_VIEW,
        );
      case NavigationConstants.SETTINGS_VIEW:
        return normalNavigate(
          const LoginView(),
          NavigationConstants.SETTINGS_VIEW,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const NotFoundNavigationWidget(),
        );
    }
  }

  //normal navigate function // in case i need a different route animation
  MaterialPageRoute<dynamic> normalNavigate(Widget widget, String pageName) {
    return MaterialPageRoute(
      builder: (context) => widget,
      settings: RouteSettings(name: pageName),
    );
  }
}
