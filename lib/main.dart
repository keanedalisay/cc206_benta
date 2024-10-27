import 'package:flutter/material.dart';
import 'package:cc206_benta/features/BentaSignUp/SignUpPage1.dart';


void main() {
  runApp(
    MaterialApp(
      title: 'Benta',
      theme: ThemeData.light(),
      home: const SignUpPage(),  // Wrap HomeView in MaterialApp to provide Directionality
    ),
  );
}
