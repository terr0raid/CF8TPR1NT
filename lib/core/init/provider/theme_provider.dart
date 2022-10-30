import 'package:flutter/material.dart';

import '../../constants/enums/app_theme.dart';
import '../theme/app_theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _currentTheme = AppTheme.lightTheme;

  AppThemes _currentThemeEnum = AppThemes.LIGHT;

  AppThemes get currentThemeEnum => _currentThemeEnum;

  ThemeData get currentTheme => _currentTheme;

  void changeValue(AppThemes theme) {
    if (theme == AppThemes.LIGHT) {
      _currentTheme = AppTheme.lightTheme;
    } else {
      _currentTheme = AppTheme.darkTheme;
    }
    notifyListeners();
  }

  void changeTheme() {
    if (_currentThemeEnum == AppThemes.LIGHT) {
      _currentTheme = AppTheme.darkTheme;
      _currentThemeEnum = AppThemes.DARK;
    } else {
      _currentTheme = AppTheme.lightTheme;
      _currentThemeEnum = AppThemes.LIGHT;
    }
    notifyListeners();
  }
}
