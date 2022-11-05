import 'package:cf8tpr1nt/core/init/firebase/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class ILoginService {
  ILoginService(this.authRepository);
  IAuthRepository authRepository;

  Future<User?> googleSignIn();
  Future<User?> facebookSignIn();
  bool isUserLoggedIn();
}

class LoginService extends ILoginService {
  LoginService(super.authRepository);

  @override
  Future<User?> googleSignIn() async {
    try {
      final response = await authRepository.signInWithGoogle();
      return response?.user;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<User?> facebookSignIn() async {
    try {
      final response = await authRepository.signInWithFacebook();
      return response?.user;
    } catch (e) {
      return null;
    }
  }

  @override
  bool isUserLoggedIn() {
    return authRepository.isUserLoggedIn();
  }
}
