abstract class INavigationService {
  Future<dynamic> navigateToPage({required String path, Object? arguments});
  Future<dynamic> navigateToPageClear({
    required String path,
    Object? arguments,
  });
  void navigatePop();
  T? getRouteArgs<T>();
}
