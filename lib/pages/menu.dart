import 'package:finacct/common/bottom.dart';
import 'package:finacct/common/commonforall.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  final List<String> imgPaths = [
    'assets/menu/receipt.png',
    'assets/menu/payment.png',
    'assets/menu/receiptreport.png',
    'assets/menu/paymentreport.png',
    'assets/menu/pushdata.png',
    'assets/menu/pull.png',
  ];
  Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Commonforall(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: GridView.builder(
                itemCount: imgPaths.length, // Show exactly 6 images
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 3 columns
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                padding: const EdgeInsets.all(14),
                itemBuilder: (context, index) {
                  return Image.asset(imgPaths[index], fit: BoxFit.cover);
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomBar(),
    );
    // );
  }
}
