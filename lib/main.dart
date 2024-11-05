import 'package:flutter/material.dart';

import 'package:cc206_benta/src/features/landing.dart';
import 'package:cc206_benta/src/features/sign-up/sign-up-1.dart';
import 'package:cc206_benta/src/features/sign-up/sign-up-2.dart';
import 'package:cc206_benta/src/features/log-in/login-1.dart';
import 'package:cc206_benta/src/features/log-in/login-2.dart';
import 'package:cc206_benta/src/features/dashboard/dashboard.dart';
import 'package:cc206_benta/src/features/dashboard/point-of-sale/point-of-sale.dart';

void main() {
  runApp(
      MaterialApp(
          title: 'Benta',
          color: Color.fromRGBO(87, 144, 8, 1),
          themeMode: ThemeMode.light,
          theme: ThemeData(
            primaryColor: Color.fromRGBO(87, 144, 8, 1),
            fontFamily: 'Inter',
              fontFamilyFallback: ['Arial']
          ),
          debugShowCheckedModeBanner: true,
          debugShowMaterialGrid: false,
          home: Landing(),
          initialRoute: '/',
        routes: {
            '/': (context) => Landing(),
            '/sign-up/about': (context) => SignUp1(),
            '/sign-up/password': (context) => SignUp2(),
            '/log-in/about': (context) => LogIn1(),
            '/log-in/password': (context) => LogIn2(),
            '/dashboard': (context) => Dashboard(),
            '/dashboard/point-of-sale': (context) => PointOfSale()
        }
      )
  );
}
