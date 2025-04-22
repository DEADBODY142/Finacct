import 'package:finacct/common/commonforall.dart';
import 'package:finacct/common/bottom.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const Commonforall(),

          // Add space between header and first container
          const SizedBox(
            height: 20,
          ), // Adjust this value to move it down more/less

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // First Container - now larger and with top margin
                  Container(
                    height: 250, // Increased from 200 to make it larger
                    width: double.infinity,
                    margin: const EdgeInsets.only(
                      top: 20,
                    ), // Pushes it down further
                    decoration: BoxDecoration(
                      color: const Color(0xffC2DDFF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  const SizedBox(height: 20),
                  Align(
                    alignment:
                        Alignment.centerLeft, // This aligns the text to left
                    child: const Text(
                      'Data Sync Options',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // Second Container
                  Container(
                    height: 100,
                    margin: const EdgeInsets.only(top: 15),
                    decoration: BoxDecoration(
                      color: const Color(0xffC2DDFF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  // Third Container
                  Container(
                    height: 100,
                    margin: const EdgeInsets.only(top: 15),
                    decoration: BoxDecoration(
                      color: const Color(0xffC2DDFF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
