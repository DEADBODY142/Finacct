import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, left: 5, right: 30),
      child: Row(
        children: [
          IconButton(
            iconSize: 30,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_circle_left_outlined),
          ),
          Expanded(
            child: SearchBar(
              leading: IconButton(
                onPressed: () {},
                icon: Icon(Icons.tune_rounded),
              ),
              elevation: WidgetStatePropertyAll(0.0),
              hintText: 'Search',
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              trailing: [const Icon(Icons.search)],
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            width: 40,
            height: 40,
            color: Colors.grey[200],
            child: IconButton(
              color: Color(0xff23538D),
              onPressed: () {},
              icon: Icon(Icons.qr_code),
            ),
          ),
        ],
      ),
    );
  }
}
