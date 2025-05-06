import 'package:finacct/common/bottom.dart';
import 'package:finacct/pages/menu.dart';
import 'package:finacct/pages/register.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool remember = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(
                  'assets/halfcircle.png',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 60,
                  child: Image.asset('assets/common/finact.png', width: 150),
                ),
              ],
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Color(0xffC2DDFF),
                  ),
                  margin: EdgeInsets.only(top: 70, left: 20, right: 20),
                  padding: EdgeInsets.only(bottom: 40),
                  width: double.infinity,
                  // height: 500,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 70.0,
                      left: 10,
                      right: 10,
                    ),
                    child: Column(
                      children: [
                        TextField(
                          controller: email,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.blue.shade800,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.blue.shade800,
                                width: 2,
                              ),
                            ),
                            hintText: "Email",
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: password,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.blue.shade800,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.blue.shade800,
                                width: 2,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Password",
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Checkbox(
                              value: remember,
                              onChanged: (bool? value) {
                                setState(() {
                                  remember = value ?? false;
                                });
                              },
                            ),
                            Text("Remember me"),
                          ],
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50,

                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Color(0xff23538D),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Menu()),
                              );
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Center(
                          child: InkWell(
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                color: Color(0xff23538D),
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: () {},
                          ),
                        ),
                        SizedBox(height: 20),
                        Center(
                          child: Icon(
                            Icons.manage_accounts,
                            size: 55,
                            color: Color(0xff23538D),
                          ),
                        ),
                        Center(
                          child: InkWell(
                            onTap:
                                () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Register(),
                                  ),
                                ),
                            child: Text(
                              "Create new account",
                              style: TextStyle(
                                color: Color(0xff23538D),
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  child: Image.asset('assets/man.png', width: 120),
                  // size: 40,
                  // color: Color(0xff23538D),
                ),
              ],
            ),
            // SizedBox(height: 60),
            // BottomBar(),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
