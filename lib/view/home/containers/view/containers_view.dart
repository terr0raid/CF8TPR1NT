import 'dart:async';

import 'package:cf8tpr1nt/core/base/state/base_state.dart';
import 'package:cf8tpr1nt/core/base/view/base_view.dart';
import 'package:cf8tpr1nt/view/home/containers/viewmodel/containers_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ContainersView extends StatefulWidget {
  const ContainersView({super.key});

  @override
  State<ContainersView> createState() => _ContainersViewState();
}

class _ContainersViewState extends BaseState<ContainersView> {
  late ContainersViewModel viewModel;
  late Completer<GoogleMapController> _controller;

  @override
  void initState() {
    super.initState();
    _controller = Completer();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: ContainersViewModel(_controller),
      builder: (context, viewModel) => buildContainersBody,
      onModelReady: (model) {
        viewModel = model;
        model
          ..setContext(context)
          ..init();
      },
      onDispose: (model) => model.dispose,
    );
  }

  Widget get buildContainersBody {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(37.42796133580664, -122.085749655962),
          zoom: 14.4746,
        ),
        onMapCreated: viewModel.controller.complete,
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'containerFAB',
        onPressed: () {},
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }
}
