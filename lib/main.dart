import 'package:cc206_benta/src/features/Inventory/manage_items_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cc206_benta/src/features/inventory/inventory_models.dart';
import 'package:cc206_benta/src/features/inventory/inventory_page.dart';


void main() {
  runApp(
    ChangeNotifierProvider<InventoryModel>(
      create: (context) => InventoryModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Benta Inventory App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const InventoryPage(),
        '/manage-items': (context) => const ManageItemsPage(),
      },
    );
  }
}