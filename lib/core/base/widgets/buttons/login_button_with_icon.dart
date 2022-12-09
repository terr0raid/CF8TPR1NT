import 'package:cf8tpr1nt/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class LoginButtonWithIcon extends StatelessWidget {
  const LoginButtonWithIcon({
    super.key,
    required this.label,
    required this.icon,
    this.size,
    required this.onPressed,
    required this.isLoading,
  });

  final Widget label;
  final Widget icon;
  final Size? size;
  final VoidCallback onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        fixedSize: size ?? Size(context.width, context.height * 0.08),
        alignment: Alignment.centerLeft,
      ),
      onPressed: !isLoading ? onPressed : null,
      icon: icon,
      label: Visibility(
        visible: !isLoading,
        replacement: const Center(child: CircularProgressIndicator()),
        child: label,
      ),
    );
  }
}
