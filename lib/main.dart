import 'package:finacct/common/commonforall.dart';
import 'package:finacct/demo.dart';
import 'package:finacct/pages/login.dart';
import 'package:finacct/pages/menu.dart';
import 'package:finacct/pages/profile.dart';
import 'package:finacct/pages/receipt.dart';
import 'package:finacct/pages/receipt_info.dart';
import 'package:finacct/pages/register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: LoginPage());
  }
}
