import 'package:flutter/cupertino.dart';

import 'i_navigation.dart';

class NavigationService implements INavigationService {
  //eager singleton
  static final NavigationService _instance = NavigationService._init();

  static NavigationService get instance => _instance;

  NavigationService._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  // ignore: prefer_function_declarations_over_variables
  get removeAllOldRoutes => (Route<dynamic> route) => false;

  @override
  Future navigateToPage({required String path, Object? arguments}) async {
    await navigatorKey.currentState!.pushNamed(path, arguments: arguments);
  }

  @override
  Future navigateToPageClear({required String path, Object? arguments}) async {
    await navigatorKey.currentState!.pushNamedAndRemoveUntil(
      path,
      removeAllOldRoutes,
      arguments: arguments,
    );
  }
}
