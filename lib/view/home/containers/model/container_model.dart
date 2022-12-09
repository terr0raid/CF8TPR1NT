// ignore_for_file: sort_constructors_first, avoid_unused_constructor_parameters
import 'package:cloud_firestore/cloud_firestore.dart';

class ContainerModel {
  final String? title;
  final String? uid;
  final GeoPoint? position;
  final String? address;

  ContainerModel({
    this.title,
    this.uid,
    this.position,
    this.address,
  });

  factory ContainerModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return ContainerModel(
      title: data?['title'] as String?,
      uid: data?['uid'] as String?,
      position: data?['position'] as GeoPoint?,
      address: data?['address'] as String?,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (title != null) 'title': title,
      if (uid != null) 'uid': uid,
      if (position != null) 'position': position,
      if (address != null) 'address': address,
    };
  }
}
