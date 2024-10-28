import 'package:flutter/material.dart';
import 'package:cc206_benta/features/login_page1.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Benta',
      theme: ThemeData.light(),
      home: const LogInPage1(),
    );
  }
}
