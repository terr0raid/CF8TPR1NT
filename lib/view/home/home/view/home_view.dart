import 'package:cf8tpr1nt/core/base/view/base_view.dart';
import 'package:cf8tpr1nt/core/extensions/context_extensions.dart';
import 'package:cf8tpr1nt/core/init/provider/home_tab_provider.dart';
import 'package:cf8tpr1nt/view/home/home/viewmodel/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

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
      child: Scaffold(
        body: Provider<HomeTabbarProvider>(
          create: (_) => HomeTabbarProvider.instance,
          builder: (context, child) => PersistentTabView(
            context,
            controller: context.read<HomeTabbarProvider>().controller,
            screens: viewModel.buildScreens,
            items: viewModel.navBarItems,
            resizeToAvoidBottomInset: true,
            decoration: NavBarDecoration(
              border: Border(
                top: BorderSide(
                  color: context.colors.primary.withOpacity(0.5),
                  width: 0.5,
                ),
              ),
            ),
            itemAnimationProperties: ItemAnimationProperties(
              duration: context.overDuration,
              curve: Curves.ease,
            ),
            padding: const NavBarPadding.symmetric(horizontal: 12, vertical: 5),
            navBarStyle: NavBarStyle.style9,
          ),
        ),
      ),
    );
  }
}
