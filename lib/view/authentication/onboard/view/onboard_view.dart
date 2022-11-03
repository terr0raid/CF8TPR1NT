import 'package:cf8tpr1nt/core/base/state/base_state.dart';
import 'package:cf8tpr1nt/core/base/view/base_view.dart';
import 'package:cf8tpr1nt/core/extensions/context_extensions.dart';
import 'package:cf8tpr1nt/feature/widgets/avatar/on_board_indicator.dart';
import 'package:cf8tpr1nt/view/authentication/onboard/model/on_board_model.dart';
import 'package:cf8tpr1nt/view/authentication/onboard/viewmodel/onboard_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({super.key});

  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends BaseState<OnBoardView> {
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<OnBoardViewModel>(
      viewModel: OnBoardViewModel(_pageController),
      onModelReady: (model) {
        model
          ..setContext(context)
          ..init();
      },
      builder: buildScaffold,
      onDispose: () => _pageController.dispose(),
    );
  }

  Widget buildScaffold(
    BuildContext context,
    OnBoardViewModel viewModel,
  ) {
    return Scaffold(
      body: Padding(
        padding: context.paddingNormal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(),
            Expanded(
              flex: 7,
              child: buildPageBuilder(viewModel),
            ),
            const Spacer(),
            Expanded(child: buildBottomNav(viewModel)),
          ],
        ),
      ),
    );
  }

  PageView buildPageBuilder(OnBoardViewModel viewModel) {
    return PageView.builder(
      itemCount: viewModel.onBoardItems.length,
      controller: viewModel.pageController,
      onPageChanged: (index) {
        viewModel.setCurrentIndex(index);
      },
      itemBuilder: (BuildContext context, int index) {
        return buildColumnBody(
          viewModel.onBoardItems[index],
          context,
        );
      },
    );
  }

  Column buildColumnBody(OnBoardModel model, BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 2, child: buildLottie(model.image ?? '', context)),
        buildColumnContent(model, context),
      ],
    );
  }

  Widget buildLottie(String path, BuildContext context) {
    return Lottie.asset(
      path,
      height: context.height * 0.8,
      width: context.width * 0.8,
    );
  }

  Column buildColumnContent(
    OnBoardModel model,
    BuildContext context,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildContentTitle(model.title ?? '', context),
        Padding(
          padding: context.paddingMedium,
          child: buildContentDescription(model.description ?? '', context),
        ),
      ],
    );
  }

  Text buildContentTitle(String title, BuildContext context) {
    return Text(
      title,
      style: context.textTheme.headline4?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text buildContentDescription(String description, BuildContext context) {
    return Text(
      description,
      style: context.textTheme.subtitle1,
      textAlign: TextAlign.center,
    );
  }

  Widget buildBottomNav(OnBoardViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        buildListViewCircles(viewModel),
        FloatingActionButton(
          onPressed: () {
            viewModel.nextPage();
          },
          child: const Icon(Icons.skip_next),
        ),
      ],
    );
  }

  ListView buildListViewCircles(OnBoardViewModel viewModel) {
    return ListView.builder(
      itemCount: 3,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Observer(
          builder: (_) {
            return OnBoardIndicator(
              isSelected: viewModel.currentIndex == index,
            );
          },
        );
      },
    );
  }
}
