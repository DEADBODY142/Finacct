import 'package:finacct/common/commonforall.dart';
import 'package:finacct/common/searchwidget.dart';
import 'package:finacct/common/style/boldtext.dart';
import 'package:flutter/material.dart';

class ReceiptInfo extends StatefulWidget {
  const ReceiptInfo({super.key});

  @override
  State<ReceiptInfo> createState() => _ReceiptInfoState();
}

class _ReceiptInfoState extends State<ReceiptInfo> {
  bool ismore = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Commonforall(),
            SearchWidget(),
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(
                top: 15,
                left: 20,
                right: 20,
                bottom: 40,
              ),
              width: 359,
              // height: 600,
              decoration: BoxDecoration(
                color: Color(0xffC2DDFF),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Name: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('Ram Bahadur Shrestha'),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Address: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('KATHMANDU'),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Group Name: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('CENTER'),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'ID Number: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('MEM-8093'),
                    ],
                  ),
                  Divider(color: Colors.white),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          spacing: 15,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "AC TYPES",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("Alchik Bachat Khata"),
                            Text(
                              "INPUT AMOUNT(NRS)",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 35,
                              child: TextField(
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 7,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                            ),
                            // SizedBox(height: 1),
                            BoldText('ACCOUNT OPEN DATE'),
                            Text('2079-01-01'),
                            BoldText('BALANCE'),
                            Text('100000'),
                            BoldText('BALANCE DATE'),
                            Text('2079-01-01'),
                            BoldText('INST AMOUNT(NRS)'),
                            Text('50'),
                            BoldText('DUE AMOUNT(NRS)'),
                            Text('500'),
                            BoldText('PB CHECK DATE'),
                            Text('2080-01-01'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          spacing: 15,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            BoldText('ACCOUNT'),
                            Text("28"),
                            BoldText('Total'),
                            Text("1000"),
                            // SizedBox(height: 1),
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: BoldText('MATURITY DATE'),
                            ),
                            Text('2080-01-01'),
                            BoldText('TOTAL'),
                            Text('1000'),
                            Text(''),
                            Text(''),
                            BoldText('TOTAL'),
                            Text('50'),
                            BoldText('TOTAL'),
                            Text('500'),
                            BoldText('REMARKS INPUT'),
                            SizedBox(
                              height: 35,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 1.0),
                                child: TextField(
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 7,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    enabled: true,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
