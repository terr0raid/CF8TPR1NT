import 'package:auto_route/auto_route.dart';
import 'package:cf8tpr1nt/core/base/view/base_view.dart';
import 'package:cf8tpr1nt/core/extensions/context_extensions.dart';
import 'package:cf8tpr1nt/view/home/home/viewmodel/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: HomeViewModel(),
      builder: buildHomeBody,
      onModelReady: (model) {
        model
          ..setContext(context)
          ..init();
      },
      onDispose: (model) => model.dispose,
    );
  }

  Widget buildHomeBody(BuildContext context, HomeViewModel viewModel) {
    return SafeArea(
      child: AutoTabsScaffold(
        routes: viewModel.buildRoutes,
        bottomNavigationBuilder: (_, tabsRouter) {
          return BottomNavigationBar(
            backgroundColor: context.colors.error,
            selectedItemColor: Colors.amber,
            unselectedItemColor: Colors.black,
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: const [
              BottomNavigationBarItem(
                label: 'Users',
                icon: Icon(Icons.person),
              ),
              BottomNavigationBarItem(
                label: 'Posts',
                icon: Icon(Icons.person),
              ),
              BottomNavigationBarItem(
                label: 'Settings',
                icon: Icon(Icons.person),
              ),
              BottomNavigationBarItem(
                label: 'Settings2',
                icon: Icon(Icons.person),
              ),
            ],
          );
          // PersistentTabView(
          //   context,
          //   screens: viewModel.screens,
          //   items: viewModel.navBarItems,
          //   resizeToAvoidBottomInset: true,
          //   decoration: NavBarDecoration(
          //     border: Border(
          //       top: BorderSide(color: context.colors.primary, width: 0.5),
          //     ),
          //   ),
          //   itemAnimationProperties: ItemAnimationProperties(
          //     duration: context.lowDuration,
          //     curve: Curves.ease,
          //   ),
          //   navBarStyle: NavBarStyle.style9,
          // );
        },
      ),
    );
  }
}
