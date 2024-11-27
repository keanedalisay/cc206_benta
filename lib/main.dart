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
@@ -15,7 +21,17 @@ void main() {
          ),
          debugShowCheckedModeBanner: true,
          debugShowMaterialGrid: false,
          home: Landing()
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
