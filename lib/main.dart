import 'package:flutter/material.dart';

void main() {
  runApp(const ReviserApp());
}

class ReviserApp extends StatelessWidget {
  const ReviserApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
