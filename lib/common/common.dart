import 'package:flutter/material.dart';

class CommonImages extends StatelessWidget {
  const CommonImages({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // Adjust based on your top.png height
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset('assets/common/top.png', fit: BoxFit.cover),

          // Centered logos column
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Finact logo
                Image.asset(
                  'assets/common/finact.png',
                  width: 120,
                  height: 120,
                ),
                const SizedBox(height: 10), // Reduced spacing
                // Register image
                Image.asset(
                  'assets/common/register.png',
                  width: 120,
                  height: 40, // Smaller height for text image
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
