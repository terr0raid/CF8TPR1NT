import 'dart:async';

import 'package:cf8tpr1nt/core/base/state/base_state.dart';
import 'package:cf8tpr1nt/core/base/view/base_view.dart';
import 'package:cf8tpr1nt/core/constants/enums/app_theme.dart';
import 'package:cf8tpr1nt/core/init/firebase/firebase_service.dart';
import 'package:cf8tpr1nt/core/init/provider/theme_provider.dart';
import 'package:cf8tpr1nt/view/home/containers/service/containers_service.dart';
import 'package:cf8tpr1nt/view/home/containers/viewmodel/containers_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

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
      viewModel: ContainersViewModel(
        _controller,
        ContainersService(FirebaseService.instance),
      ),
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
      body: Observer(
        builder: (_) {
          if (context.watch<ThemeProvider>().currentThemeEnum ==
              AppThemesEnum.DARK) {
            viewModel
                .loadMapStyles(context.watch<ThemeProvider>().currentThemeEnum);

            viewModel.controller.future.then((value) async {
              await value.setMapStyle(viewModel.mapStyle);
            });
          } else {
            viewModel
                .loadMapStyles(context.watch<ThemeProvider>().currentThemeEnum);

            viewModel.controller.future.then((value) async {
              await value.setMapStyle(viewModel.mapStyle);
            });
          }

          return Stack(
            children: [
              GoogleMap(
                initialCameraPosition: const CameraPosition(
                  target: LatLng(38.02162663442264, 32.512445225112366),
                  zoom: 15,
                ),
                onMapCreated: viewModel.controller.complete,
                markers: viewModel.markers,
              ),
              Center(
                child: Visibility(
                  visible: viewModel.isLoading,
                  child: const CircularProgressIndicator(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
