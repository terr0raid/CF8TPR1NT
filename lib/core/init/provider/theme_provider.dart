import 'package:flutter/material.dart';

import '../../constants/enums/app_theme.dart';
import '../theme/app_theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _currentTheme = AppTheme.lightTheme;

  AppThemes _currenThemeEnum = AppThemes.LIGHT;

  /// Applicaton theme enum.
  /// Deafult value is [AppThemes.LIGHT]
  AppThemes get currenThemeEnum => _currenThemeEnum;

  ThemeData get currentTheme => _currentTheme;

  void changeValue(AppThemes theme) {
    if (theme == AppThemes.LIGHT) {
      _currentTheme = AppTheme.lightTheme;
    } else {
      _currentTheme = AppTheme.darkTheme;
    }
    notifyListeners();
  }

  /// Change your app theme with [currenThemeEnum] value.
  void changeTheme() {
    if (_currenThemeEnum == AppThemes.LIGHT) {
      _currentTheme = AppTheme.darkTheme;
      _currenThemeEnum = AppThemes.DARK;
    } else {
      _currentTheme = AppTheme.lightTheme;

      _currenThemeEnum = AppThemes.LIGHT;
    }
    notifyListeners();
  }
}
