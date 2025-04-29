import 'package:flutter/material.dart';

class BoldText extends StatelessWidget {
  final String text;
  final Color? color;
  final TextStyle? style;

  const BoldText(this.text, {this.color, this.style, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: (style ?? TextStyle()).copyWith(
        fontWeight: FontWeight.bold, // Keep the font weight bold
        color: color ?? Colors.black, // Default to black unless specified
      ),
    );
  }
}
