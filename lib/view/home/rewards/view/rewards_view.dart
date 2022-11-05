import 'package:cf8tpr1nt/core/base/state/base_state.dart';
import 'package:cf8tpr1nt/core/base/view/base_view.dart';
import 'package:cf8tpr1nt/view/home/rewards/viewmodel/rewards_view_model.dart';
import 'package:flutter/material.dart';

class RewardsView extends StatefulWidget {
  const RewardsView({super.key});

  @override
  State<RewardsView> createState() => _RewardsViewState();
}

class _RewardsViewState extends BaseState<RewardsView> {
  late RewardsViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: RewardsViewModel(),
      builder: (context, viewModel) => buildRewardsBody,
      onModelReady: (model) {
        viewModel = model;
        model
          ..setContext(context)
          ..init();
      },
    );
  }

  Widget get buildRewardsBody {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rewards'),
      ),
      body: const Center(
        child: Text('Rewards'),
      ),
    );
  }
}
