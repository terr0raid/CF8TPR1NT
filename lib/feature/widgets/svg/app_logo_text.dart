import 'package:cf8tpr1nt/feature/constants/image_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppLogoWithText extends StatelessWidget {
  const AppLogoWithText({super.key, required this.height, required this.width});
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
      width: width,
      height: height,
    );
  }
}
