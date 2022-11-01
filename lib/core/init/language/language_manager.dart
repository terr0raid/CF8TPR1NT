// ignore_for_file: prefer_constructors_over_static_methods

import 'package:flutter/material.dart';

class LanguageManager {
  LanguageManager._init();
  static LanguageManager? _instance;
  static LanguageManager get instance {
    _instance ??= LanguageManager._init();
    return _instance!;
  }

  Locale get enLocale => const Locale('en', 'US');
  Locale get trLocale => const Locale('tr', 'TR');

  List<Locale> get supportedLocales => [enLocale, trLocale];
}
