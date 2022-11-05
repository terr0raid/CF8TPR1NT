import 'package:cf8tpr1nt/core/base/widgets/not_found_navigation_widget.dart';
import 'package:cf8tpr1nt/core/constants/navigation/navigation_constants.dart';
import 'package:cf8tpr1nt/view/authentication/login/view/login_view.dart';
import 'package:cf8tpr1nt/view/authentication/onboard/view/onboard_view.dart';
import 'package:cf8tpr1nt/view/authentication/splash/view/splash_view.dart';
import 'package:cf8tpr1nt/view/home/home_view.dart';
import 'package:flutter/material.dart';

class NavigationRoute {
  NavigationRoute._init();
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT:
        return normalNavigate(
          const SplashView(),
          NavigationConstants.DEFAULT,
        );
      case NavigationConstants.HOME_VIEW:
        return normalNavigate(
          const HomeView(),
          NavigationConstants.HOME_VIEW,
        );
      case NavigationConstants.LOGIN_VIEW:
        return normalNavigate(
          const LoginView(),
          NavigationConstants.LOGIN_VIEW,
        );
      case NavigationConstants.ON_BOARD_VIEW:
        return normalNavigate(
          const OnBoardView(),
          NavigationConstants.ON_BOARD_VIEW,
        );
      case NavigationConstants.CONTAINERS_VIEW:
        return normalNavigate(
          const OnBoardView(),
          NavigationConstants.CONTAINERS_VIEW,
        );
      case NavigationConstants.CONTAINER_DETAIL_VIEW:
        return normalNavigate(
          const LoginView(),
          NavigationConstants.CONTAINER_DETAIL_VIEW,
        );
      case NavigationConstants.REWARDS_VIEW:
        return normalNavigate(
          const LoginView(),
          NavigationConstants.REWARDS_VIEW,
        );
      case NavigationConstants.REWARD_DETAIL_VIEW:
        return normalNavigate(
          const LoginView(),
          NavigationConstants.REWARD_DETAIL_VIEW,
        );
      case NavigationConstants.DONATION_VIEW:
        return normalNavigate(
          const LoginView(),
          NavigationConstants.DONATION_VIEW,
        );
      case NavigationConstants.DONATION_DETAIL_VIEW:
        return normalNavigate(
          const LoginView(),
          NavigationConstants.DONATION_DETAIL_VIEW,
        );
      case NavigationConstants.PROFILE_VIEW:
        return normalNavigate(
          const LoginView(),
          NavigationConstants.PROFILE_VIEW,
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
