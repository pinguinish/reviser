import 'package:flutter/material.dart';
import 'package:reviser/core/bloc/constant/palette.dart';

mixin SnackBarManager {
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