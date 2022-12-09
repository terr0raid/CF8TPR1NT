// ignore_for_file: sort_constructors_first, avoid_unused_constructor_parameters
import 'package:cloud_firestore/cloud_firestore.dart';

class RewardModel {
  final String? title;
  final String? description;
  final String? image;
  final String? points;
  final String? id;
  final String? language;
  final String? type;

  RewardModel({
    this.title,
    this.description,
    this.image,
    this.points,
    this.id,
    this.language,
    this.type,
  });

  factory RewardModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return RewardModel(
      title: data?['title'] as String?,
      description: data?['description'] as String?,
      image: data?['image'] as String?,
      points: data?['points'] as String?,
      id: data?['id'] as String?,
      language: data?['language'] as String?,
      type: data?['type'] as String?,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (image != null) 'image': image,
      if (points != null) 'points': points,
      if (language != null) 'language': language,
      if (type != null) 'type': type,
    };
  }
}
