import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ve_news/config/res/res.dart';

class AppTextTheme extends TextTheme {
  AppTextTheme()
      : super(
          headlineMedium: GoogleFonts.montserrat(
            fontSize: fontSize800,
            fontWeight: FontWeight.w700,
            color: AppColors.black,
          ),
          titleLarge: GoogleFonts.montserrat(
            fontSize: fontSize700,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
          titleMedium: GoogleFonts.montserrat(
            fontSize: fontSize500,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
          displayLarge: GoogleFonts.permanentMarker(
            fontSize: fontSize600,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
          bodyMedium: GoogleFonts.montserrat(
            fontSize: fontSize300,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
          bodySmall: GoogleFonts.montserrat(
            fontSize: fontSize200,
            fontWeight: FontWeight.w300,
            color: AppColors.black,
          ),
        );

  static double get fontSize800 => 48;
  static double get fontSize700 => 42;
  static double get fontSize600 => 22;
  static double get fontSize500 => 20;
  static double get fontSize400 => 18;
  static double get fontSize300 => 16;
  static double get fontSize200 => 14;
  static double get fontSize100 => 10;
  static double get fontSize50 => 8;
}

// Alias
extension AliasAppThemeX on TextTheme {
  TextStyle? get mainTitle => headlineMedium;
}

extension ThemeContext on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}
