import 'package:cf8tpr1nt/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class OnBoardIndicator extends StatelessWidget {
  final bool isSelected;
  const OnBoardIndicator({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: CircleAvatar(
        backgroundColor:
            context.colors.primary.withOpacity(isSelected ? 1 : 0.2),
        radius: isSelected ? context.width * 0.015 : context.width * 0.01,
      ),
    );
  }
}
