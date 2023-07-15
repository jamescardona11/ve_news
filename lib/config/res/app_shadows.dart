import 'package:flutter/material.dart' show BoxShadow, Colors, Offset;

abstract class AppShadows {
  static const shadow100 = BoxShadow(
    color: Colors.black26,
    blurRadius: 5,
    spreadRadius: -2,
    offset: Offset(1, 1),
  );

  static const shadow200 = BoxShadow(
    color: Colors.black26,
    blurRadius: 10,
    spreadRadius: -4,
  );
}
