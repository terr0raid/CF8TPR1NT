import 'package:cf8tpr1nt/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class StandartBox extends StatelessWidget {
  const StandartBox({super.key, required this.child, this.height, this.color});
  final Widget child;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: context.paddingLow,
      decoration: BoxDecoration(
        color: color ?? context.colors.inversePrimary.withOpacity(0.6),
        borderRadius: context.lowBorderRadius,
      ),
      child: Center(child: child),
    );
  }
}
