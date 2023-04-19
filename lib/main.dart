import 'package:flutter/material.dart';
import 'package:today_my_school/pages/sing_in.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.grey,
          elevation: 0,
          centerTitle: true,
        ),
        primaryColor: Colors.grey,
      ),
      home: const SignInPage(),
    );
  }
}
