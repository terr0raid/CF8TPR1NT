import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomeTabbarProvider {
  HomeTabbarProvider._init();
  //eager singleton
  static final HomeTabbarProvider _instance = HomeTabbarProvider._init();

  static HomeTabbarProvider get instance => _instance;

  final controller = PersistentTabController();

  void setIndex(int index) {
    controller.jumpToTab(index);
  }
}
