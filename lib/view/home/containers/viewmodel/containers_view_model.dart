// ignore_for_file: lines_longer_than_80_chars

import 'dart:async';

import 'package:cf8tpr1nt/core/base/model/base_view_model.dart';
import 'package:cf8tpr1nt/feature/constants/image_paths.dart';
import 'package:cf8tpr1nt/feature/utils/byte_converter.dart';
import 'package:cf8tpr1nt/view/home/containers/service/containers_service.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
part 'containers_view_model.g.dart';

class ContainersViewModel = _ContainersViewModelBase with _$ContainersViewModel;

abstract class _ContainersViewModelBase with Store, BaseViewModel {
  _ContainersViewModelBase(this.controller, this.containersService);
  final Completer<GoogleMapController> controller;

  late final ContainersService containersService;

  @observable
  Set<Marker> markers = <Marker>{};

  @observable
  bool isLoading = false;

  @override
  void setContext(BuildContext context) => ctx = context;

  @override
  void init() {
    _addMarkers();
  }

  @override
  void dispose() {
    _dispose();
  }

  Future<void> _dispose() async {
    final sub = await controller.future;
    sub.dispose();
  }

  @action
  Future<void> _addMarkers() async {
    _changeLoading();

    final markerIcon = await ImageConverter.getBytesFromAsset(
      ImagePaths.instance.thrashLogo,
      100,
    );
    final markerBitmap = BitmapDescriptor.fromBytes(markerIcon);
    final resMarkers = await containersService.getContainers();
    if (resMarkers != null) {
      markers.addAll(
        resMarkers
            .map(
              (marker) => Marker(
                markerId: MarkerId(marker.uid ?? 'Unknown'),
                position: LatLng(
                  marker.position!.latitude,
                  marker.position!.longitude,
                ),
                infoWindow: InfoWindow(
                  title: marker.title,
                  snippet: marker.address,
                ),
                icon: markerBitmap,
              ),
            )
            .toList(),
      );
    }
    _changeLoading();
  }

  @action
  void _changeLoading() {
    isLoading = !isLoading;
  }
}
