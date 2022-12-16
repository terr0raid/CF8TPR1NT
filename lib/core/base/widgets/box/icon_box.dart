import 'package:cf8tpr1nt/core/base/widgets/box/standart_box.dart';
import 'package:cf8tpr1nt/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class IconBox extends StatelessWidget {
  const IconBox({
    super.key,
    required this.icon,
    required this.child,
    this.color,
    this.height,
  });

  final Widget icon;
  final Widget child;
  final Color? color;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return StandartBox(
      height: height,
      color: color,
      child: ListTile(
        iconColor: context.colors.onSurface,
        minLeadingWidth: 0,
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
          ],
        ),
        title: child,
      ),
    );
  }
}
