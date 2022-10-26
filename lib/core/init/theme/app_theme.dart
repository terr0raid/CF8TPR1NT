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
        scaffoldBackgroundColor: AppColors.BLACK,
        appBarTheme: const AppBarTheme().copyWith(
          color: AppColors.BLACK,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          elevation: 1,
          shadowColor: AppColors.WHITE,
        ),
        bottomAppBarTheme: const BottomAppBarTheme().copyWith(
          color: AppColors.BLACK,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData().copyWith(
          backgroundColor: AppColors.BLACK,
          selectedItemColor: AppColors.WHITE,
          unselectedItemColor: AppColors.WHITE,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
        ),
        snackBarTheme: const SnackBarThemeData().copyWith(
          elevation: 0,
          backgroundColor: AppColors.WHITE,
          actionTextColor: AppColors.BLACK,
        ),
        primaryColor: AppColors.BLACK,
        colorScheme: const ColorScheme.dark().copyWith(
          primary: AppColors.WHITE,
          secondary: AppColors.BLACK,
        ),
        textTheme: GoogleFonts.ralewayTextTheme().copyWith().apply(
              displayColor: AppColors.WHITE,
              bodyColor: AppColors.WHITE,
            ),
        floatingActionButtonTheme:
            const FloatingActionButtonThemeData().copyWith(
          backgroundColor: AppColors.WHITE,
          foregroundColor: AppColors.BLACK,
          elevation: 2.0,
        ),
      );

  static ThemeData get lightTheme => ThemeData.light().copyWith(
        visualDensity: VisualDensity.standard,
        scaffoldBackgroundColor: AppColors.WHITE,
        appBarTheme: const AppBarTheme().copyWith(
          foregroundColor: AppColors.BLACK,
          color: AppColors.WHITE,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          elevation: 1,
          shadowColor: AppColors.BLACK,
        ),
        bottomAppBarTheme: const BottomAppBarTheme().copyWith(
          color: AppColors.WHITE,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData().copyWith(
          backgroundColor: AppColors.WHITE,
          selectedItemColor: AppColors.BLACK,
          unselectedItemColor: AppColors.BLACK,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
        ),
        snackBarTheme: const SnackBarThemeData().copyWith(
          elevation: 0,
          backgroundColor: AppColors.BLACK,
          actionTextColor: AppColors.WHITE,
        ),
        primaryColor: AppColors.WHITE,
        colorScheme: const ColorScheme.light().copyWith(
          primary: AppColors.BLACK,
          secondary: AppColors.WHITE,
        ),
        textTheme: GoogleFonts.ralewayTextTheme().copyWith().apply(
              displayColor: AppColors.BLACK,
              bodyColor: AppColors.BLACK,
              decorationColor: AppColors.BLACK,
            ),
        floatingActionButtonTheme:
            const FloatingActionButtonThemeData().copyWith(
          backgroundColor: AppColors.BLACK,
          foregroundColor: AppColors.WHITE,
          elevation: 2.0,
        ),
      );
}
