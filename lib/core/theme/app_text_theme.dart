import 'package:flutter/material.dart';
import 'package:reviser/core/bloc/constant/palette.dart';

class AppTextTheme extends TextTheme {

  static const fontFamily = "ProductSansInfanity";

  @override
  TextStyle get displayLarge => const TextStyle(
        color: Palette.black,
        fontSize: 42,
        fontWeight: FontWeight.bold,
      );

  @override
  // TODO: implement displayMedium
  TextStyle? get displayMedium => const TextStyle(
    color: Palette.black, 
    fontSize: 24,
  );
}
