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
  String get googleLogo => 'ic_google_logo'.toSVG;
  String get facebookLogo => 'ic_facebook_logo'.toSVG;

  //images
  String get loginBg => 'footprint'.toPng;
  String get temaLogo => 'ic_tema'.toPng;
  String get tskmehmetcikLogo => 'ic_tsk_mehmetcik_vakfi'.toPng;
  String get tskgvLogo => 'ic_tskgv'.toPng;
  String get thrashLogo => 'ic_thrash'.toPng;
}
