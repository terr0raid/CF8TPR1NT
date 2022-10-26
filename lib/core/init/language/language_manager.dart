import 'package:flutter/material.dart';

class LanguageManager {
  static LanguageManager? _instance;
  static LanguageManager get instance {
    _instance ??= LanguageManager._init();
    return _instance!;
  }

  LanguageManager._init();

  Locale get enLocale => const Locale('en', 'US');
  Locale get trLocale => const Locale('tr', 'TR');

  List<Locale> get supportedLocales => [enLocale, trLocale];
}
