import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class IAuthRepository {

  IAuthRepository(this.firebaseAuth);
  final FirebaseAuth firebaseAuth;

  Future<User?> signInWithGoogle();
  Future<void> signOut();
  Future<User?> currentUser();
}

class AuthRepository implements IAuthRepository {

  AuthRepository(this.firebaseAuth);
  @override
  final FirebaseAuth firebaseAuth;

  @override
  Future<User?> signInWithGoogle() async {
    final googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return null;
    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await firebaseAuth.signInWithCredential(credential);
    return firebaseAuth.currentUser;
  }

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<User?> currentUser() async {
    return firebaseAuth.currentUser;
  }
}
