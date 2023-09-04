import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:reviser/core/bloc/constant/dimension.dart';
import 'package:reviser/core/bloc/constant/palette.dart';
import 'package:reviser/core/bloc/constant/strings.dart';

class IconTextButton extends StatelessWidget {
  const IconTextButton({
    super.key,
    required this.icon, 
    required this.label,
    this.onPressed,
  });

  final Icon icon;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        backgroundColor: Palette.indigo,
        foregroundColor: Palette.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            Dimension.defaultRadius,
          ),
        ),
      ),
      onPressed: onPressed,
      child:  Column(
        children: [
          icon,
          Text(label),
        ],
      ),
    );
  }
}
