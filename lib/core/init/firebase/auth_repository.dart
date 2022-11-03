import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class IAuthRepository {
  IAuthRepository(this.firebaseAuth);
  final FirebaseAuth firebaseAuth;

  Future<UserCredential?> signInWithGoogle();
  Future<void> signOut();
  User? currentUser();
  Stream<User?> get authStateChanges;
}

class AuthRepository implements IAuthRepository {
  AuthRepository(this.firebaseAuth);
  @override
  final FirebaseAuth firebaseAuth;

  @override
  Future<UserCredential> signInWithGoogle() async {
    final googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) throw Exception('User cancelled the login process');
    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    try {
      await firebaseAuth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        if (e.email != null && e.credential != null) {
          final userSignInMethods =
              await firebaseAuth.fetchSignInMethodsForEmail(e.email!);
          if (userSignInMethods.first == 'facebook.com') {
            final userCredential = await signInWithFacebook();
            await userCredential.user?.linkWithCredential(e.credential!);
          }
        }
      }
    }
    return firebaseAuth.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithFacebook() async {
    final loginResult = await FacebookAuth.instance.login();

    if (loginResult.accessToken == null) {
      throw Exception('User cancelled the login process');
    }
    final facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  @override
  User? currentUser() {
    return firebaseAuth.currentUser;
  }

  @override
  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();
}
