import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/app/app_colors.dart';

class AppTheme {
  static final AppTheme _instance = AppTheme._init();
  static AppTheme get instance => _instance;

  AppTheme._init();

  static ThemeData get darkTheme => ThemeData.dark().copyWith(
        visualDensity: VisualDensity.standard,
        scaffoldBackgroundColor: AppColors.indigo,
        appBarTheme: const AppBarTheme().copyWith(
          color: AppColors.indigo,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          elevation: 1,
          shadowColor: AppColors.white,
        ),
        bottomAppBarTheme: const BottomAppBarTheme().copyWith(
          color: AppColors.indigo,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData().copyWith(
          backgroundColor: AppColors.indigo,
          selectedItemColor: AppColors.white,
          unselectedItemColor: AppColors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
        ),
        snackBarTheme: const SnackBarThemeData().copyWith(
          elevation: 0,
          backgroundColor: AppColors.white,
          actionTextColor: AppColors.indigo,
        ),
        primaryColor: AppColors.indigo,
        colorScheme: const ColorScheme.dark().copyWith(
          primary: AppColors.white,
          secondary: AppColors.indigo,
        ),
        textTheme: GoogleFonts.ralewayTextTheme().copyWith().apply(
              displayColor: AppColors.white,
              bodyColor: AppColors.white,
            ),
        floatingActionButtonTheme:
            const FloatingActionButtonThemeData().copyWith(
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.indigo,
          elevation: 2.0,
        ),
      );

  static ThemeData get lightTheme => ThemeData.light().copyWith(
        visualDensity: VisualDensity.standard,
        scaffoldBackgroundColor: AppColors.white,
        appBarTheme: const AppBarTheme().copyWith(
          foregroundColor: AppColors.indigo,
          color: AppColors.white,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          elevation: 1,
          shadowColor: AppColors.indigo,
        ),
        bottomAppBarTheme: const BottomAppBarTheme().copyWith(
          color: AppColors.white,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData().copyWith(
          backgroundColor: AppColors.white,
          selectedItemColor: AppColors.indigo,
          unselectedItemColor: AppColors.indigo,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
        ),
        snackBarTheme: const SnackBarThemeData().copyWith(
          elevation: 0,
          backgroundColor: AppColors.indigo,
          actionTextColor: AppColors.white,
        ),
        primaryColor: AppColors.white,
        colorScheme: const ColorScheme.light().copyWith(
          primary: AppColors.indigo,
          secondary: AppColors.white,
        ),
        textTheme: GoogleFonts.ralewayTextTheme().copyWith().apply(
              displayColor: AppColors.indigo,
              bodyColor: AppColors.indigo,
              decorationColor: AppColors.indigo,
            ),
        floatingActionButtonTheme:
            const FloatingActionButtonThemeData().copyWith(
          backgroundColor: AppColors.indigo,
          foregroundColor: AppColors.white,
          elevation: 2.0,
        ),
      );
}
