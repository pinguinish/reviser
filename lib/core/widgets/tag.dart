import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  const Tag({super.key, required this.tag, this.color = Colors.black});

  final String tag;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        tag,
        style: TextStyle(
          color: color.withOpacity(0.8),
        ),
      ),
    );
  }
}
