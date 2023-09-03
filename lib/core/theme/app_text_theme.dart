import 'package:flutter/material.dart';
import 'package:reviser/core/constant/palette.dart';

class AppTextTheme extends TextTheme {

  static const fontFamily = "ProductSansInfanity";

  @override
  TextStyle get displayLarge => const TextStyle(
        color: Palette.black,
        fontSize: 42,
        fontWeight: FontWeight.bold,
      );
}
