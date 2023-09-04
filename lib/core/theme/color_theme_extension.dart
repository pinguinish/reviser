import 'package:flutter/material.dart';
import 'package:reviser/core/bloc/constant/palette.dart';

final class ColorThemeExtension extends ThemeExtension<ColorThemeExtension> {
  ColorThemeExtension({
    required this.primary,
    required this.secondary,
    required this.supplementaryText,
    required this.highlightText,
    required this.optionElement,
  });

  final Color? primary;
  final Color? secondary;
  final Color? supplementaryText;
  final Color? highlightText;
  final Color? optionElement;

  @override
  ThemeExtension<ColorThemeExtension> lerp(
    ColorThemeExtension? other,
    double t,
  ) {
    return ColorThemeExtension(
      primary: Color.lerp(primary, other?.primary, t),
      secondary: Color.lerp(secondary, other?.secondary, t),
      supplementaryText:
          Color.lerp(supplementaryText, other?.supplementaryText, t),
      highlightText: Color.lerp(highlightText, other?.highlightText, t),
      optionElement: Color.lerp(optionElement, other?.optionElement, t),
    );
  }

  @override
  ThemeExtension<ColorThemeExtension> copyWith({
    Color? primary,
    Color? secondary,
    Color? supplementaryText,
    Color? highlightText,
    Color? optionElement,
  }) {
    return ColorThemeExtension(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      supplementaryText: supplementaryText ?? this.supplementaryText,
      highlightText: highlightText ?? this.highlightText,
      optionElement: optionElement ?? this.optionElement,
    );
  }
}

extension ApplierThemeExtension on ThemeData {
  ThemeData applyAllExtension() => copyWith(
        extensions: [
          ColorThemeExtension(
            primary: Palette.indigo,
            secondary: Palette.white,
            supplementaryText: Palette.grey,
            highlightText: Palette.black,
            optionElement: Palette.optionElement,
          ),
        ],
      );
}
