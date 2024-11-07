import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cc206_benta/src/features/inventory/inventory.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => InventoryModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inventory App',
      initialRoute: '/',  // Set initial route for Inventory
      routes: {
          '/': (context) => const InventoryScreen(),
          '/manage-items': (context) => const ManageItemsPage(),

      },
      
    );
  }
}
