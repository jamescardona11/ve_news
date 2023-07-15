import 'package:flutter/material.dart' show Color;

// https://coolors.co/f8f9fa-e9ecef-dee2e6-ced4da-adb5bd-6c757d-495057-343a40-212529
// https://coolors.co/palette/22577a-38a3a5-57cc99-80ed99-c7f9cc

abstract class AppColors {
  static const Color primary = Color(0xff023e8a);
  static const Color secondary = Color(0xff0077b6);

  // blue variations
  static const Color blueLight = Color(0xffE8E6FF);
  static const Color blueLight100 = Color(0xffE2E0FF);
  static const Color blueLight200 = Color(0xffD9D6FF);
  static const Color blueLight300 = Color(0xffC4C1FF);
  static const Color blueDark = Color(0xFF131035);

  // grey
  static const Color grey = Color(0xFFced4da);
  static const Color grey50 = Color(0xFFA0A2A5);
  static const Color lightGrey100 = Color(0xFFdee2e6);
  static const Color lightGrey200 = Color(0xFFe9ecef);

  static const Color white = Color(0xfff7f4f4);
  static const Color black = Color(0xFF142129);
  static const Color creamColor = Color(0xFFfcf4e7);

  static const Color red = Color(0xffE97079);
  static const Color orange = Color(0xffFB873A);
  static const Color emerald = Color(0xFF57cc99);
  static const Color keppel = Color(0xFFFFEC33);

  // derivatives
  static const Color error = red;
  static const Color drawerBackground = blueDark;
  static const Color scaffoldBackground = white;

  // animated random colors
  static const List<Color> blobColors = [
    secondary,
    emerald,
    Color(0xffa4a6f6),
    keppel,
  ];
}
