import 'package:flutter/material.dart';
import 'package:reviser/core/constant/palette.dart';

abstract class ReviserAppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Palette.background,
    useMaterial3: true,
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Palette.background,
    useMaterial3: true,
  );
}
