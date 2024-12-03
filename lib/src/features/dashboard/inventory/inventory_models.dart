import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InventoryItem {
  String name; 
  String brand;
  int quantity; 
  double price;
  String? imagePath;
  String weight;
  double vat;
  String category;
  int minStock;


  InventoryItem({
    required this.name,
    required this.brand,
    required this.quantity,
    required this.price,
    required this.category,
    required this.vat,
    required this.minStock,
    this.imagePath,
    required this.weight,
  });


  InventoryItem copyWith({ 
    String? name,
    String? brand,
    int? quantity,
    double? price,
    String? imagePath,
    String? weight,
    double? vat,
    String? category,
    int? minStock,
  }) {
    return InventoryItem(
      name: name ?? this.name,
      brand: brand ?? this.brand,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      imagePath: imagePath ?? this.imagePath,
      weight: weight ?? this.weight,
      vat: vat ?? this.vat,
      category: category ?? this.category,
      minStock: minStock ?? this.minStock,
    );
  }


  Map<String, dynamic> toJson() => {
        'name': name,
        'brand': brand,
        'quantity': quantity,
        'price': price,
        'imagePath': imagePath,
        'weight': weight,
        'vat': vat,
        'category': category,
        'minStock': minStock,
      };

  factory InventoryItem.fromJson(Map<String, dynamic> json) => InventoryItem(
        name: json['name'] ?? '', 
        brand: json['brand'] ?? '',
        quantity: json['quantity'] ?? 0,
        price: (json['price'] as num?)?.toDouble() ?? 0.0,
        imagePath: json['imagePath'],
        weight: json['weight'] ?? '', 
        vat: (json['vat'] as num?)?.toDouble() ?? 0.0,
        category: json['category'] ?? '',
        minStock: json['minStock'] as int? ?? 0,
      );
}


class InventoryModel extends ChangeNotifier {
  List<InventoryItem> _inventoryItems = [];

  List<InventoryItem> get inventoryItems => List.unmodifiable(_inventoryItems);

  InventoryModel() {
    _loadItems();
  }

  void addItem(InventoryItem newItem) {
    _inventoryItems.add(newItem);
    _saveItems();
    notifyListeners();
  }



  void updateItem(InventoryItem oldItem, InventoryItem newItem){
      final index = _inventoryItems.indexOf(oldItem);
      if(index != -1){
          _inventoryItems[index] = newItem;
          _saveItems();
          notifyListeners(); 
      }
  }



   void updateQuantity(InventoryItem item, int newQuantity) { 
    final index = _inventoryItems.indexOf(item);
    if (index != -1) {
      _inventoryItems[index].quantity = newQuantity; 
      _saveItems(); 
      notifyListeners(); 
    }
  }


  void deleteItems(List<InventoryItem> itemsToDelete) {
    _inventoryItems.removeWhere((item) => itemsToDelete.contains(item));
    _saveItems();
    notifyListeners();
  }

  void updateItemImage(InventoryItem item, String? newImagePath) {
    final index = _inventoryItems.indexOf(item);
    if (index != -1) {
      _inventoryItems[index] = _inventoryItems[index].copyWith(imagePath: newImagePath); 
      _saveItems();
      notifyListeners();
    }
  }

    Future<void> _saveItems() async {
    final prefs = await SharedPreferences.getInstance();
    final itemsJson = _inventoryItems.map((item) => item.toJson()).toList();
    await prefs.setString('inventoryItems', jsonEncode(itemsJson));
  }



Future<void> _loadItems() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final itemsJson = prefs.getString('inventoryItems');
      if (itemsJson != null) {
        final List<dynamic> decodedJson = jsonDecode(itemsJson);
        _inventoryItems = decodedJson
            .map((item) => InventoryItem.fromJson(item as Map<String, dynamic>))
            .toList(); 
      }
    } catch (e) {
      debugPrint("Error loading items: $e"); 
      _inventoryItems = [];  
    }
     notifyListeners();
}
}