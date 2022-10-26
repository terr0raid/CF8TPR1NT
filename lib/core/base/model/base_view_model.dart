import 'package:flutter/material.dart';

import '../../init/network/network_service.dart';

mixin BaseViewModel {
  late BuildContext ctx;

  final NetworkService service = NetworkService.instance;

  void setContext(BuildContext ctx);
  void init();
}
