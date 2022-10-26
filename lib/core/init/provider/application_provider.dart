import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'theme_provider.dart';

class ApplicationProvider {
  static ApplicationProvider? _instance;
  static ApplicationProvider get instance {
    _instance ??= ApplicationProvider._init();
    return _instance!;
  }

  ApplicationProvider._init();

  List<SingleChildWidget> dependItems = [
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
    ),
  ];
}
