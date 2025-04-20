import 'package:flutter/material.dart';

class Commonforall extends StatelessWidget {
  const Commonforall({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Background image
        Image.asset(
          'assets/common/top.png',
          width: double.infinity,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const Text(
              'Background image not found!',
              style: TextStyle(color: Colors.red),
            );
          },
        ),
        // Overlay logo
        Image.asset(
          'assets/common/finact.png',
          width: 150,
          height: 150,
          errorBuilder: (context, error, stackTrace) {
            return const Text(
              'Logo not found!',
              style: TextStyle(color: Colors.red),
            );
          },
        ),
      ],
    );
  }
}
