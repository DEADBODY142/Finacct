import 'package:finacct/common/bottom.dart';
import 'package:finacct/common/commonforall.dart';
import 'package:finacct/common/style/boldtext.dart';
import 'package:flutter/material.dart';

class ReceiptReport extends StatefulWidget {
  const ReceiptReport({super.key});

  @override
  State<ReceiptReport> createState() => _ReceiptReportState();
}

class _ReceiptReportState extends State<ReceiptReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // Make entire body scrollable including BottomBar
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Commonforall(),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_circle_left_outlined),
                    iconSize: 32,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 24),
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Color(0xffC2DDFF),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      BoldText('AMOUNT', style: TextStyle(fontSize: 16)),
                      SizedBox(width: 10),
                      Text('Rs. 1000.0', style: TextStyle(fontSize: 12)),
                      SizedBox(width: 10),
                      BoldText('COUNT', style: TextStyle(fontSize: 16)),
                      SizedBox(width: 10),
                      Text('1', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
                SizedBox(width: 14),
                Container(
                  margin: EdgeInsets.only(top: 24),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xffC2DDFF),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.swap_vert),
                  ),
                ),
              ],
            ),
            buildReceiptCard(),
            buildReceiptCard(),

            // Centered BottomBar with padding
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: BottomBar(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildReceiptCard() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0xffC2DDFF),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              right: 3,
              child: GestureDetector(
                onTap: () {},
                child: Image.asset('assets/receipt/print.png', height: 30),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                SizedBox(height: 10),
                Table(
                  columnWidths: const {
                    0: FlexColumnWidth(4),
                    1: FlexColumnWidth(4.8),
                    2: FlexColumnWidth(1.8),
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.top,
                  children: [
                    TableRow(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 6),
                          child: infoText(
                            'AC TYPES',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 6),
                          child: infoText(
                            'ACCOUNT',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 6),
                          child: infoText(
                            'AMOUNT',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            infoText('Aichik Bachat Khata'),
                            Text(
                              'Remarks: Jhapa',
                              style: TextStyle(fontSize: 8),
                            ),
                          ],
                        ),
                        infoText('0102ABK-11-000577-1'),
                        infoText('200.0'),
                      ],
                    ),
                    TableRow(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            infoText('10 Years Dobbar Bachat'),
                            Text(
                              'Remarks: Jhapa',
                              style: TextStyle(fontSize: 8),
                            ),
                          ],
                        ),
                        infoText('0102RBK-11-003477-1'),
                        infoText('200.0'),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: BoldText('Total'),
                        ),
                        SizedBox(),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: infoText('400'),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget infoText(String text, {TextStyle? style}) {
    return Text(text, style: const TextStyle(fontSize: 13).merge(style));
  }
}
