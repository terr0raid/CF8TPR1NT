import 'package:cf8tpr1nt/core/init/navigation/i_navigation.dart';
import 'package:flutter/cupertino.dart';

class NavigationService implements INavigationService {
  NavigationService._init();
  //eager singleton
  static final NavigationService _instance = NavigationService._init();

  static NavigationService get instance => _instance;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  // ignore: prefer_function_declarations_over_variables
  bool Function(Route<dynamic>) get removeAllOldRoutes =>
      (Route<dynamic> route) => false;

  @override
  Future<void> navigateToPage({required String path, Object? arguments}) async {
    await navigatorKey.currentState!.pushNamed(path, arguments: arguments);
  }

  @override
  Future<void> navigateToPageClear({
    required String path,
    Object? arguments,
  }) async {
    await navigatorKey.currentState!.pushNamedAndRemoveUntil(
      path,
      removeAllOldRoutes,
      arguments: arguments,
    );
  }

  @override
  void navigatePop() {
    return navigatorKey.currentState!.pop();
  }

  @override
  T? getRouteArgs<T>() {
    final settings = ModalRoute.of(navigatorKey.currentContext!)!.settings;
    return settings.arguments as T;
  }
}
