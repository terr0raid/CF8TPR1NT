import 'dart:async';

import 'package:cf8tpr1nt/core/base/model/base_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
part 'containers_view_model.g.dart';

class ContainersViewModel = _ContainersViewModelBase with _$ContainersViewModel;

abstract class _ContainersViewModelBase with Store, BaseViewModel {
  _ContainersViewModelBase(this.controller);
  final Completer<GoogleMapController> controller;

  @override
  void setContext(BuildContext context) => ctx = context;

  @override
  void init() {}

  @override
  void dispose() {
    _dispose();
  }

  Future<void> _dispose() async {
    final sub = await controller.future;
    sub.dispose();
  }

  // Future<void> _goToTheLake() async {
  //   final mapController = await controller.future;
  //   await mapController.animateCamera(
  //     CameraUpdate.newCameraPosition(
  //       const CameraPosition(
  //         target: LatLng(37.42796133580664, -122.085749655962),
  //         zoom: 14.4746,
  //       ),
  //     ),
  //   );
  // }
}
