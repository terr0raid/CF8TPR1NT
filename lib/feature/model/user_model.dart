// ignore_for_file: sort_constructors_first, avoid_unused_constructor_parameters
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final int? points;
  final String? uid;

  UserModel({
    this.points,
    this.uid,
  });

  factory UserModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return UserModel(
      points: data?['points'] as int?,
      uid: data?['uid'] as String?,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (points != null) 'points': points,
    };
  }
}
