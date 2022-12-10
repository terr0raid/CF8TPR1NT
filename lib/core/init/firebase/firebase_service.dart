// ignore_for_file: prefer_constructors_over_static_methods

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  FirebaseService._init();
  static FirebaseService? _instance;
  static FirebaseService get instance {
    _instance ??= FirebaseService._init();
    return _instance!;
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseFirestore get firestore => _firestore;
  FirebaseAuth get auth => _auth;
}
