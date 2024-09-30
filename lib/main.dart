import 'package:flutter/material.dart';
import 'package:cc206_benta/features/login_page.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Benta',
      theme: ThemeData.light(),
      home: const LogInPage(),
    ),
  );
}