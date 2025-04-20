import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();

    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xffC2DDFF),
              ),
              margin: EdgeInsets.only(top: 200, left: 20, right: 20),
              // padding: EdgeInsets.only(top: 1000),
              width: double.infinity,
              height: 300,
              child: Column(
                children: [
                  TextField(
                    controller: email,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: "Email",
                    ),
                  ),
                  TextField(controller: password),
                  // ElevatedButton(onPressed: () {}, child: Text("Login")),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
