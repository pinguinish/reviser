import 'package:flutter/material.dart';
import 'package:reviser/core/constant/palette.dart';

abstract class SnackBarManager {
  static void info({
    required BuildContext context,
    required String info,
    Duration duration = const Duration(milliseconds: 500),
  }) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            info,
            style: const TextStyle(color: Palette.white),
          ),
          duration: duration,
          backgroundColor: Palette.indigo,
        ),
      );
}
