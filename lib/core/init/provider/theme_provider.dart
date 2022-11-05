import 'package:cf8tpr1nt/core/constants/enums/app_theme.dart';
import 'package:cf8tpr1nt/core/init/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _currentTheme = AppTheme.lightTheme;

  AppThemesEnum _currentThemeEnum = AppThemesEnum.LIGHT;

  AppThemesEnum get currentThemeEnum => _currentThemeEnum;

  ThemeData get currentTheme => _currentTheme;

  void setTheme(AppThemesEnum theme) {
    if (theme == AppThemesEnum.LIGHT) {
      _currentTheme = AppTheme.lightTheme;
    } else {
      _currentTheme = AppTheme.darkTheme;
    }
    notifyListeners();
  }

  void changeTheme() {
    if (_currentThemeEnum == AppThemesEnum.LIGHT) {
      _currentTheme = AppTheme.darkTheme;
      _currentThemeEnum = AppThemesEnum.DARK;
    } else {
      _currentTheme = AppTheme.lightTheme;
      _currentThemeEnum = AppThemesEnum.LIGHT;
    }
    notifyListeners();
  }
}
