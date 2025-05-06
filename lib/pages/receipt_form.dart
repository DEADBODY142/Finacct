import 'package:finacct/common/commonforall.dart';
import 'package:finacct/common/searchwidget.dart';
import 'package:finacct/common/style/boldtext.dart';
import 'package:finacct/form/leftside.dart';
import 'package:finacct/form/rightside.dart';
import 'package:flutter/material.dart';

class ReceiptForm extends StatefulWidget {
  const ReceiptForm({super.key});

  @override
  State<ReceiptForm> createState() => _ReceiptFormState();
}

class _ReceiptFormState extends State<ReceiptForm> {
  bool ismore = true;
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
                bottom: 20,
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
                      Expanded(child: LeftColumn()),
                      Expanded(child: RightColumn()),
                    ],
                  ),
                  if (ismore) ...[
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 10),
                      child: Divider(color: Colors.white),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: LeftColumn()),
                        Expanded(child: RightColumn()),
                      ],
                    ),
                  ],
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(150, 3), //* height does nothing
                  elevation: 5,
                  backgroundColor: Color(0xffC2DDFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: BoldText('Update'),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(
                          'Would you like to print the receipt?',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.w900),
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Ram Bahadur Shrestha',
                              // style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Amount: '),
                                SizedBox(width: 8),
                                Text('10000'),
                              ],
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Amount Added',
                              // style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              'Successfully',
                              // style: TextStyle(fontSize: 20),
                            ),
                            Image.asset(
                              'assets/common/finact.png',
                              height: 100,
                              width: 130,
                            ),
                            Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 60,
                            ),
                          ],
                        ),
                        actionsAlignment: MainAxisAlignment.center,
                        actions: [
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                                Color(0xffAE0003),
                              ),
                              foregroundColor: WidgetStateProperty.all(
                                Colors.white,
                              ),
                            ),
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text("Cancel"),
                          ),
                          SizedBox(width: 10),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                                Color(0xffC2DDFF),
                              ),
                              foregroundColor: WidgetStateProperty.all(
                                Colors.black,
                              ),
                            ),
                            child: Text("Confirm"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
