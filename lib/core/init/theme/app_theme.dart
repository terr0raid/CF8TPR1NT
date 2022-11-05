import 'package:cf8tpr1nt/core/constants/app/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

part 'color_schemes.g.dart';

class AppTheme {
  AppTheme._init();
  static final AppTheme _instance = AppTheme._init();
  static AppTheme get instance => _instance;

  static ThemeData get darkTheme => ThemeData.dark(
        useMaterial3: true,
      ).copyWith(
        visualDensity: VisualDensity.standard,
        appBarTheme: const AppBarTheme().copyWith(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          elevation: 1,
        ),
        colorScheme: darkColorScheme,
        textTheme: GoogleFonts.ralewayTextTheme().copyWith(),
        floatingActionButtonTheme:
            const FloatingActionButtonThemeData().copyWith(
          elevation: 2,
        ),
      );

  static ThemeData get lightTheme => ThemeData.light(
        useMaterial3: true,
      ).copyWith(
        visualDensity: VisualDensity.standard,
        appBarTheme: const AppBarTheme().copyWith(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          elevation: 1,
        ),
        colorScheme: lightColorScheme,
        textTheme: GoogleFonts.ralewayTextTheme().copyWith(),
        floatingActionButtonTheme:
            const FloatingActionButtonThemeData().copyWith(
          elevation: 2,
        ),
      );
}
