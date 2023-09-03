import 'package:flutter/material.dart';
import 'package:reviser/core/constant/palette.dart';
import 'package:reviser/core/theme/app_text_theme.dart';

abstract class ReviserAppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Palette.background,
    useMaterial3: true,
    textTheme: AppTextTheme(),
    fontFamily: AppTextTheme.fontFamily,
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Palette.background,
    useMaterial3: true,
    textTheme: AppTextTheme(),
    fontFamily: AppTextTheme.fontFamily,
  );
}
