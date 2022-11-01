import 'package:cf8tpr1nt/core/base/state/base_state.dart';
import 'package:cf8tpr1nt/core/base/view/base_view.dart';
import 'package:cf8tpr1nt/view/authentication/test/test_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TestView extends StatefulWidget {
  const TestView({super.key});

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends BaseState<TestView> {
  late TestViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<TestViewModel>(
      viewModel: TestViewModel(),
      onModelReady: (model) {
        model
          ..setContext(context)
          ..init();
        viewModel = model;
      },
      builder: (context, viewModel) => buildApp,
    );
  }

  Widget get buildApp {
    return Scaffold(
      appBar: AppBar(
        leading: _leadingText,
        title: _titleText,
      ),
      floatingActionButton: _floatingActionButton,
    );
  }

  Widget get _titleText {
    return Observer(
      builder: (_) {
        return Text(viewModel.counter.toString());
      },
    );
  }

  Widget get _leadingText {
    return Observer(
      builder: (_) {
        return const Text('rr');
      },
    );
  }

  Widget get _floatingActionButton {
    return FloatingActionButton(
      onPressed: () async {
        viewModel.increment();
      },
      child: const Icon(Icons.add),
    );
  }
}
