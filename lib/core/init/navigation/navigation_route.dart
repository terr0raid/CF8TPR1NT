import 'package:flutter/material.dart';

import '../../../view/authentication/test/test_view.dart';
import '../../base/widgets/not_found_navigation_widget.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT:
        return normalNavigate(const TestView(), NavigationConstants.DEFAULT);
      default:
        return MaterialPageRoute(
          builder: (context) => const NotFoundNavigationWidget(),
        );
    }
  }

  //normal navigate function // in case i need a different route animation
  MaterialPageRoute normalNavigate(Widget widget, String pageName) {
    return MaterialPageRoute(
      builder: (context) => widget,
      settings: RouteSettings(name: pageName),
    );
  }
}
