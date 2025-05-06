import 'package:finacct/common/bottom.dart';
import 'package:finacct/common/commonforall.dart';
import 'package:finacct/pages/menu.dart';
import 'package:flutter/material.dart';
import 'profile.dart';

class PushData extends StatelessWidget {
  const PushData({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Commonforall(),
          SizedBox(height: screenHeight * 0.04),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Menu()),
              );
            },
            child: Container(
              height: screenHeight * 0.12,
              margin: EdgeInsets.all(screenHeight * 0.02),
              padding: EdgeInsets.all(screenWidth * 0.04),
              decoration: BoxDecoration(
                color: const Color(0xffC2DDFF),
                borderRadius: BorderRadius.circular(20),
              ),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       children: [
              //         Image.asset('assets/push/push.png'),
              //         Text('Upload Data'),
              //       ],
              //     ),

              //     // child: buildImageWithTextRow(
              //     //   'assets/profile/fetchall.png',
              //     //   'Fetch All Data',
              //     //   'Replace all existing records with fresh data',
              //     //   screenWidth,
              //     // ),
              //   ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
