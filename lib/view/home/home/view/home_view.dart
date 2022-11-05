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
      child: PersistentTabView(
        context,
        screens: viewModel.buildScreens,
        items: viewModel.navBarItems,
        resizeToAvoidBottomInset: true,
        decoration: NavBarDecoration(
          border: Border(
            top: BorderSide(color: context.colors.primary, width: 0.5),
          ),
        ),
        itemAnimationProperties: ItemAnimationProperties(
          duration: context.lowDuration,
          curve: Curves.ease,
        ),
        navBarStyle: NavBarStyle.style9,
      ),
    );
  }
}
