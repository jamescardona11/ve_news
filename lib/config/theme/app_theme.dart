// fonts: https://www.youtube.com/watch?v=iJ0LT1vkh6M

import 'package:flutter/material.dart';
import 'package:ve_news/config/res/res.dart';
import 'package:ve_news/config/theme/text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData darkTheme() {
    return ThemeData.dark().copyWith(
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: AppTextTheme(),
      colorScheme: const ColorScheme.light().copyWith(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
      ),
      scaffoldBackgroundColor: AppColors.scaffoldBackground,
      // elevatedButtonTheme:
    );
  }
}
