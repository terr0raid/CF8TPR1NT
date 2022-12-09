import 'package:cf8tpr1nt/core/init/firebase/auth_repository.dart';
import 'package:cf8tpr1nt/feature/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class IProfileService {
  IProfileService(this.authRepository, this.firestore);
  IAuthRepository authRepository;
  FirebaseFirestore firestore;

  Future<void> signOut();
  User? get currentUser;

  Future<UserModel?> getUser(String uid);
}

class ProfileService extends IProfileService {
  ProfileService(super.authRepository, super.firestore);

  @override
  Future<void> signOut() async {
    await authRepository.signOut();
  }

  @override
  User? get currentUser => authRepository.currentUser;

  @override
  Future<UserModel?> getUser(String uid) {
    return firestore
        .collection('users')
        .doc(uid)
        .withConverter(
          fromFirestore: UserModel.fromFirestore,
          toFirestore: (model, options) {
            return model.toFirestore();
          },
        )
        .get()
        .then(
          (value) => value.data(),
        );
  }
}
