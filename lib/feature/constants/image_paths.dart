import 'package:cf8tpr1nt/core/extensions/string_extensions.dart';

class ImagePaths {
  ImagePaths._init();
  static final ImagePaths _instance = ImagePaths._init();
  static ImagePaths get instance => _instance;

  //images
  // String get logo => 'assets/images/logo.png';
  //lotties
  String get recycleBus => 'ic_recycle_bus'.toLottie;
  String get usingPhone => 'ic_using_phone'.toLottie;
  String get welcome => 'ic_welcome'.toLottie;

  //svg
  String get appLogo => 'ic_app_logo'.toSVG;
  String get textAppLogo => 'ic_text_app_logo'.toSVG;

  //images
  String get loginBg => 'footprint'.toPng;
}
