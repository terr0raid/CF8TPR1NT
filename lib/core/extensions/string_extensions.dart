import 'package:cf8tpr1nt/core/constants/app/app_constants.dart';

extension StringValidation on String {
  // String get locale => this.tr();

  bool get isValidEmail =>
      RegExp(ApplicationConstants.EMAIL_REGEX).hasMatch(this);
}

extension ImagePathExtension on String {
  String get toSVG => 'assets/svg/$this.svg';
  String get toLottie => 'assets/lottie/$this.json';
}
