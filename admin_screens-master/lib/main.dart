import 'package:admin_project/app_screen/admin_board.dart';
import 'package:admin_project/app_screen/final_report.dart';
import 'package:admin_project/app_screen/login.dart';
import 'package:admin_project/app_screen/report.dart';
import 'package:flutter/material.dart';
import 'app_screen/conf.dart';
import 'app_screen/detail.dart';
import 'app_screen/requests.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ID Card', debugShowCheckedModeBanner: false, home: log_in(1));
  }
}
