import 'package:flutter/material.dart';
import 'package:talktive/RegisterPage.dart';
import 'package:talktive/core/theme.dart';
import 'package:talktive/login.dart';
import 'package:talktive/messages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //Root of app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: Messages(),
    );
  }
}
