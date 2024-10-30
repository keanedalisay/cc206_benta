import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'Inventory.dart';

void main() {
  runApp(const InventoryApp()); // Run the world gurls
=======

import 'package:cc206_benta/features/inventory/inventory.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => InventoryModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp( // Remove 'const' here
      home: InventoryApp(), 
      
    );
  }
>>>>>>> Stashed changes
}