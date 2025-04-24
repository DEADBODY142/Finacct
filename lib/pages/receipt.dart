import 'package:finacct/common/bottom.dart';
import 'package:finacct/common/commonforall.dart';
import 'package:finacct/common/searchwidget.dart';
import 'package:finacct/pages/receipt_info.dart';
import 'package:flutter/material.dart';

class Receipt extends StatefulWidget {
  const Receipt({super.key});

  @override
  State<Receipt> createState() => _ReceiptState();
}

class _ReceiptState extends State<Receipt> {
  bool isHidden = true;
  @override
  Widget build(BuildContext context) {
    var name = 'Ram Bahadur Shrestha';
    var amt = '10000';
    return Scaffold(
      body: Column(
        children: [
          Commonforall(),
          SearchWidget(),
          GestureDetector(
            onTap:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReceiptInfo()),
                ),
            child: Container(
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.only(left: 10, top: 25, bottom: 20),
              width: 359,
              // height: 200,
              decoration: BoxDecoration(
                color: Color(0xffC2DDFF),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),

                    child: Text(
                      'Amount',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: [
                        Text(
                          isHidden ? 'Rs. XXX.XX' : 'Rs. $amt',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isHidden = !isHidden;
                            });
                          },
                          child: Icon(
                            isHidden ? Icons.visibility_off : Icons.visibility,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Wrap(
                    runSpacing: 10,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        width: 160,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Color(0xffE6F1FF),

                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          'Alchik Bachat Khata',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      Container(
                        width: 160,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Color(0xffE6F1FF),

                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          '10 Years Dobbar bachat',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      Container(
                        width: 160,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Color(0xffE6F1FF),

                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          '10 Years Dobbar bachat',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
