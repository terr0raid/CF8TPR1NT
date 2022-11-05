import 'package:cf8tpr1nt/core/base/state/base_state.dart';
import 'package:cf8tpr1nt/core/base/view/base_view.dart';
import 'package:cf8tpr1nt/view/home/donations/viewmodel/donations_view_model.dart';
import 'package:flutter/material.dart';

class DonationsView extends StatefulWidget {
  const DonationsView({super.key});

  @override
  State<DonationsView> createState() => _DonationsViewState();
}

class _DonationsViewState extends BaseState<DonationsView> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: DonationsViewModel(),
      builder: (context, viewModel) => buildDonationsBody,
      onModelReady: (model) {
        model
          ..setContext(context)
          ..init();
      },
    );
  }

  Widget get buildDonationsBody {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donations'),
      ),
      body: const Center(
        child: Text('Donations'),
      ),
    );
  }
}
