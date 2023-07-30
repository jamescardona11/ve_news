import 'package:flutter/material.dart' show Color, Colors;

// https://coolors.co/f8f9fa-e9ecef-dee2e6-ced4da-adb5bd-6c757d-495057-343a40-212529
// https://coolors.co/palette/22577a-38a3a5-57cc99-80ed99-c7f9cc

abstract class AppColors {
  static const Color primary = Color(0xFF3c33a6);
  static const Color primaryLight = Color(0xFF6b61cf);
  static const Color secondary = Color(0xFFF6F6F6);
  static const Color textColor = Color(0xFF2D2D2F);
  static const Color secondaryTextColor = Color(0xFF8D8D8E);

  static const Color grey = Color(0xFFced4da);
  static const Color grey50 = Color(0xFFA0A2A5);
  static const Color lightGrey100 = Color(0xFFdee2e6);
  static const Color lightGrey200 = Color(0xFFe9ecef);
  static Color lightGrey300 = Colors.grey.shade100;

  static const Color white = Color(0xfff7f4f4);
  static const Color black = Color(0xFF142129);

  static const Color purple = Color(0xFFE8E8FD);
  static const Color pureWhite = Color(0xFFffffff);

  static const Color scaffoldBackground = white;
}
