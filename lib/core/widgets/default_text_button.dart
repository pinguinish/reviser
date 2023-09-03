import 'package:flutter/material.dart';
import 'package:reviser/core/constant/palette.dart';
import '../../core/constant/dimension.dart';

class DefaultTextButton extends StatelessWidget {
  const DefaultTextButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final (horizontal, vertical) = Dimension.defaultButtonPaddingHV;
    return TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: horizontal,
            vertical: vertical,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(Dimension.defaultRadius),
            ),
          ),
          backgroundColor: Palette.indigo,
          foregroundColor: Palette.white,
          textStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        onPressed: onPressed,
        child: Text(text));
  }
}
