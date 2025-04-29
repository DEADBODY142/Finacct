import 'package:finacct/common/style/boldtext.dart';
import 'package:flutter/material.dart';

class RightColumn extends StatefulWidget {
  const RightColumn({super.key});

  @override
  State<RightColumn> createState() => _RightColumnState();
}

class _RightColumnState extends State<RightColumn> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
        ),
      ],
    );
  }
}
