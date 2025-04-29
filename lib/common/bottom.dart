import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: Text(
        " Info brain technologies Pvt. Ltd.",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xff23538D),
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
