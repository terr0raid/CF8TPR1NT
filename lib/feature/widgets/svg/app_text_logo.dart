import 'package:cf8tpr1nt/feature/constants/app/image_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppTextLogo extends StatelessWidget {
  const AppTextLogo({super.key, required this.height, required this.width});
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildLogo,
        buildText,
      ],
    );
  }

  Widget get buildLogo {
    return SvgPicture.asset(
      ImagePaths.instance.appLogo,
      width: width,
      height: height,
    );
  }

  Widget get buildText {
    return SvgPicture.asset(
      ImagePaths.instance.textAppLogo,
      alignment: Alignment.centerRight,
      width: width,
      height: height,
    );
  }
}
