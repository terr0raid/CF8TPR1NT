import 'package:cf8tpr1nt/core/init/cache/locale_manager.dart';
import 'package:flutter/material.dart';

import '../../init/navigation/navigation_service.dart';
import '../../init/network/network_service.dart';

mixin BaseViewModel {
  late BuildContext ctx;

  final NetworkService networkService = NetworkService.instance;
  final NavigationService navigationService = NavigationService.instance;
  final LocaleManager localeManager = LocaleManager.instance;
  void setContext(BuildContext ctx);
  void init();
}
