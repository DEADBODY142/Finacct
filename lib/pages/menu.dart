import 'package:finacct/common/bottom.dart';
import 'package:finacct/common/commonforall.dart';
import 'package:finacct/pages/receipt.dart';
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

  final List<Widget> paths = [Receipt()];
  Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Commonforall(),
            Padding(
              padding: const EdgeInsets.only(top: 45.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: imgPaths.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                padding: const EdgeInsets.all(10),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => paths[index]),
                      );
                    },
                    child: Image.asset(imgPaths[index], fit: BoxFit.cover),
                  );
                },
              ),
            ),
            BottomBar(),
          ],
        ),
      ),
      // bottomNavigationBar: BottomBar(),
    );
    // );
  }
}
