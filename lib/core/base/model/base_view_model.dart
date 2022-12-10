import 'package:cf8tpr1nt/core/init/cache/locale_manager.dart';
import 'package:cf8tpr1nt/core/init/firebase/firebase_service.dart';
import 'package:cf8tpr1nt/core/init/navigation/navigation_service.dart';
import 'package:cf8tpr1nt/core/init/network/network_service.dart';
import 'package:flutter/material.dart';

mixin BaseViewModel {
  late BuildContext ctx;

  final NetworkService networkService = NetworkService.instance;
  final NavigationService navigation = NavigationService.instance;
  final LocaleManager localeManager = LocaleManager.instance;
  final FirebaseService firebaseService = FirebaseService.instance;
  void setContext(BuildContext ctx);
  void init();
  void dispose();
}
