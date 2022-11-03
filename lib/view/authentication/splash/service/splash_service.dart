import 'package:cf8tpr1nt/core/init/cache/locale_manager.dart';
import 'package:cf8tpr1nt/core/init/firebase/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class ISplashService {
  ISplashService(this.authRepository);
  IAuthRepository authRepository;

  Future<void> initiliazeDevice();
  User? getCurrentUser();
}

class SplashService extends ISplashService {
  SplashService(super.manager);

  @override
  Future<void> initiliazeDevice() async {
    await Future.wait([
      LocaleManager.preferencesInstance(),
    ]);
  }

  @override
  User? getCurrentUser() {
    return authRepository.currentUser();
  }
}
