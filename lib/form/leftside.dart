import 'package:finacct/common/style/boldtext.dart';
import 'package:flutter/material.dart';

class LeftColumn extends StatefulWidget {
  const LeftColumn({super.key});

  @override
  State<LeftColumn> createState() => _LeftColumnState();
}

class _LeftColumnState extends State<LeftColumn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("AC TYPES", style: TextStyle(fontWeight: FontWeight.bold)),
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
              contentPadding: EdgeInsets.symmetric(vertical: 7),
              filled: true,
              fillColor: Colors.white,
              enabled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 3),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 3),
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
    );
  }
}
