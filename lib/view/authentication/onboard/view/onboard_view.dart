import 'package:cf8tpr1nt/core/base/view/base_view.dart';
import 'package:cf8tpr1nt/core/extensions/context_extensions.dart';
import 'package:cf8tpr1nt/view/authentication/onboard/viewmodel/onboard_view_model.dart';
import 'package:flutter/material.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({super.key});

  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  @override
  Widget build(BuildContext context) {
    OnBoardViewModel viewModel;
    return BaseView<OnBoardViewModel>(
      viewModel: OnBoardViewModel(),
      onModelReady: (model) {
        viewModel = model;
        model.setContext(context);
        model.init();
      },
      builder: (BuildContext context, OnBoardViewModel value) => buildScaffold,
    );
  }
}

Widget get buildScaffold => Scaffold(
      body: PageView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: context.randomColor,
          );
        },
      ),
    );
