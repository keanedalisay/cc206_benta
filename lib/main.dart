import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'package:cc206_benta/src/features/landing.dart';
import 'package:cc206_benta/src/features/sign-up/sign-up-1.dart';
import 'package:cc206_benta/src/features/sign-up/sign-up-2.dart';
import 'package:cc206_benta/src/features/log-in/login-1.dart';
import 'package:cc206_benta/src/features/log-in/login-2.dart';
import 'package:cc206_benta/src/features/dashboard/dashboard.dart';
import 'package:cc206_benta/src/features/dashboard/point-of-sale/point-of-sale.dart';
import 'package:cc206_benta/src/features/dashboard/point-of-sale/checkout-point-of-sale.dart';
import 'package:cc206_benta/src/features/dashboard/point-of-sale/cash-on-hand-point-of-sale.dart';
import 'package:cc206_benta/src/features/dashboard/point-of-sale/add-items-point-of-sale.dart';
import 'package:cc206_benta/src/features/dashboard/point-of-sale/receipt-point-of-sale.dart';
import 'package:cc206_benta/src/features/inventory/manage_items_page.dart';
import 'package:cc206_benta/src/features/inventory/inventory_models.dart';
import 'package:cc206_benta/src/features/inventory/inventory_page.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options:
  FirebaseOptions(
      apiKey: 'AIzaSyBsKt5oNVdpoahJxoDO3BTyVIUMFTLzGvc',
      appId: '1:832625997623:android:2c6959e2cbf7e8c158ccb2',
      messagingSenderId: '832625997623',
      projectId: 'benta-681ba')
  );

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
          initialRoute: '/',
          routes: {
            '/sign-up/about': (context) => SignUp1(),
            '/sign-up/password': (context) => SignUp2(),
            '/log-in/about': (context) => LogIn1(),
            '/log-in/password': (context) => LogIn2(),
            '/dashboard': (context) => Dashboard(),
            '/dashboard/point-of-sale': (context) => PointOfSale(),
            '/dashboard/point-of-sale/add-items': (context) => AddItems(),
            '/dashboard/point-of-sale/checkout/1': (context) => Checkout1(),
            '/dashboard/point-of-sale/checkout/2': (context) => Checkout2(),
            '/dashboard/point-of-sale/checkout/receipt': (context) => Receipt(),
            '/dashboard/inventory': (context) => InventoryPage(),
            '/dashboard/inventory/manage-items': (context) => ManageItemsPage(),
          }
      )
  );
}