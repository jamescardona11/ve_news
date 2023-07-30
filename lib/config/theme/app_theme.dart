// fonts: https://www.youtube.com/watch?v=iJ0LT1vkh6M

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ve_news/config/res/res.dart';
import 'package:ve_news/config/theme/text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData appTheme() {
    final textTheme = AppTextTheme();

    return ThemeData.dark().copyWith(
      brightness: Brightness.dark,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: AppColors.scaffoldBackground,
      textTheme: textTheme,
      colorScheme: const ColorScheme.light().copyWith(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.primary,
          minimumSize: const Size(double.infinity, AppDimens.size40),
          elevation: 0,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: AppColors.primary),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.secondary,
        border: _defaultOutlineInputBorder,
        enabledBorder: _defaultOutlineInputBorder,
        focusedBorder: _defaultOutlineInputBorder,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        hintStyle: textTheme.titleLarge?.copyWith(color: AppColors.grey50),
      ),

      searchBarTheme: SearchBarThemeData(
        backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.red),
        textStyle: MaterialStateProperty.resolveWith((states) => textTheme.bodySmall?.copyWith(color: AppColors.black)),
        hintStyle: MaterialStateProperty.resolveWith((states) => textTheme.bodySmall?.copyWith(color: AppColors.black)),

        // inputStyle: TextStyle(color: Colors.black),
        // hintStyle: TextStyle(color: Colors.grey),
        // iconColor: Colors.blue,
        // closeIconColor: Colors.red,
        // clearIconColor: Colors.green,
        // searchIcon: Icon(Icons.search),
        // closeIcon: Icon(Icons.close),
        // clearIcon: Icon(Icons.clear),
        // elevation: 4,
        // borderRadius: BorderRadius.circular(8),
        // padding: EdgeInsets.symmetric(horizontal: 16),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: textTheme.titleLarge,
        iconTheme: const IconThemeData(color: AppColors.textColor),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.secondaryTextColor,
        brightness: Brightness.light,
        disabledColor: AppColors.grey,
        labelStyle: textTheme.bodyMedium,
        padding: const EdgeInsets.all(AppDimens.size8),
        secondaryLabelStyle: textTheme.bodySmall!.copyWith(color: Colors.white),
        secondarySelectedColor: AppColors.secondaryTextColor,
        selectedColor: AppColors.primary,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(AppDimens.radius10)),
      ),
      // elevatedButtonTheme:
    );
  }

  static OutlineInputBorder get _defaultOutlineInputBorder => const OutlineInputBorder(borderSide: BorderSide.none);
}
