import 'package:flutter/material.dart';

class AppError extends StatelessWidget {
  const AppError({
    super.key,
    required this.error,
    this.stackTrace,
  });

  final Object error;
  final StackTrace? stackTrace;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(error.toString()),
    );
  }
}
