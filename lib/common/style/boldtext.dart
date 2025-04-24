import 'package:flutter/material.dart';

class BoldText extends StatelessWidget {
  final String text;
  final Color? color;

  const BoldText(this.text, {this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: color ?? Colors.black,
      ),
    );
  }
}
