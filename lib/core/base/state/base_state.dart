import 'package:flutter/material.dart';

import '../../extensions/context_extensions.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  ThemeData get theme => context.theme;
  double dynamicHeight(double value) => context.height * value;
  double dynamicWidth(double value) => context.width * value;
}
