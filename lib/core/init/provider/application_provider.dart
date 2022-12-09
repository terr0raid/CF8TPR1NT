// ignore_for_file: prefer_constructors_over_static_methods

import 'package:cf8tpr1nt/core/init/navigation/navigation_service.dart';
import 'package:cf8tpr1nt/core/init/provider/home_tab_provider.dart';
import 'package:cf8tpr1nt/core/init/provider/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ApplicationProvider {
  ApplicationProvider._init();
  static ApplicationProvider? _instance;
  static ApplicationProvider get instance {
    _instance ??= ApplicationProvider._init();
    return _instance!;
  }

  List<SingleChildWidget> dependItems = [
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
    ),
    Provider.value(value: NavigationService.instance),
    Provider.value(value: HomeTabbarProvider.instance),
  ];
}
