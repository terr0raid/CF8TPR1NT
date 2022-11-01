import 'package:cf8tpr1nt/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  ThemeData get theme => context.theme;
  double dynamicHeight(double value) => context.height * value;
  double dynamicWidth(double value) => context.width * value;
}
