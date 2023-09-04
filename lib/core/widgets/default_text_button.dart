import 'package:flutter/material.dart';
import 'package:reviser/core/bloc/constant/palette.dart';
import 'package:reviser/core/utils/screen_util.dart';
import '../bloc/constant/dimension.dart';

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
            // [WARNING]: Don't do this. (I'm just a bit lazy)
            vertical: context.deviceType is MediumDeviceType ? vertical : vertical + 10,
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
