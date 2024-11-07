import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


// --- Inventory Scaffold --- //
// --- appnav with temporary bottom nav --- //

class InventoryScaffold extends StatefulWidget {
  const InventoryScaffold({super.key});

  @override
  State<InventoryScaffold> createState() => _InventoryScaffoldState();
}

class _InventoryScaffoldState extends State<InventoryScaffold> {
  int _currentIndex = 1;

  final List<Widget> _screens = [
    Container(color: Colors.blue), // Placeholder for Dashboard
    const InventoryScreen(),
    Container(color: Colors.red), // Placeholder for Sales
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset('assets/icons/boxes-gray.png',
              width: 30, 
              height: 30, 
              fit: BoxFit.contain, 
            ),
            const SizedBox(width: 15),
            const Text(
              "Inventory",
              style: TextStyle(
                fontSize: 25,
                color: Color(0xFF787878),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Dashboard'),
          BottomNavigationBarItem(
              icon: Icon(Icons.inventory_2), label: 'Inventory'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Sales'),
        ],
      ),
    );
  }
}


// --- Inventory Screen --- //
class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<InventoryModel>(
      builder: (context, inventoryModel, child) {
        double totalValue = inventoryModel.inventoryItems.fold(
            0, (sum, item) => sum + item.quantity * item.price);

        return Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Total Inventory Value",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF579008),
                ),
              ),
              Text(
                "₱ ${totalValue.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF579008),
                ),
              ),
              const SizedBox(height: 30),

              // Low Inventory Levels
              const Text(
                "Low Inventory Levels",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF787878),
                ),
              ),
              
              const SizedBox(height: 10),

              Expanded(
                child: buildLowInventoryList(inventoryModel),
              ),

              const SizedBox(height: 20),
              
              // --- inventory items
              const Text(
                "Inventory  Items",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF787878),
                ),
              ),

              const SizedBox(height: 10),

              Expanded(
                child: buildInventoryList(inventoryModel),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ManageItemsPage()),
                    );
                  },
                  child: const Text(
                    "Manage items",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // --- Items in the inventory --- //
  Widget buildInventoryList(InventoryModel inventoryModel) {
    return ListView.builder(
      itemCount: inventoryModel.inventoryItems.length,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.amber[100],
          elevation: 10,
          child: _buildInventoryItem(
            inventoryModel.inventoryItems[index].name,
            inventoryModel.inventoryItems[index].quantity,
          ),
        );
      },
    );
  }

  // --- items that are low in quantity --- // 
  Widget buildLowInventoryList(InventoryModel inventoryModel) {
    final lowInventoryItems = inventoryModel.inventoryItems
        .where((item) => item.quantity <= 5)
        .toList();

    if (lowInventoryItems.isEmpty) {
      return const Center(
          child: Text("No items are currently low in stock."));
    }

    return ListView.builder(
        itemCount: lowInventoryItems.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.pink[50],
            elevation: 5,
            child: _buildInventoryItem(
              lowInventoryItems[index].name,
              lowInventoryItems[index].quantity,
            ),
          );
        });
  }

  Widget _buildInventoryItem(String name, int quantity) {
    return ListTile(
      title: Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.w700),
      ),
      trailing: Text("$quantity", style: const TextStyle(fontSize: 15)),
    );
  }
}


// --- Inventory Item ---
class InventoryItem {
  final String name;
  int quantity;
  final double price;
  String? imagePath;

  InventoryItem({
    required this.name,
    required this.quantity,
    required this.price,
    this.imagePath,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'quantity': quantity,
        'price': price,
        'imagePath': imagePath,
      };

  factory InventoryItem.fromJson(Map<String, dynamic> json) => InventoryItem(
        name: json['name'],
        quantity: json['quantity'],
        price: json['price'].toDouble(),  // Explicitly cast to double
        imagePath: json['imagePath'],
      );
}



        // --- Inventory Model --- //
// --- back-end part of the inventory ---//
class InventoryModel extends ChangeNotifier {
  List<InventoryItem> inventoryItems = [];

  InventoryModel() {
    _loadData();
  }

  void addItem(InventoryItem newItem) {
    inventoryItems.add(newItem);
    notifyListeners();
    _saveData();
  }

  void updateQuantity(InventoryItem item, int newQuantity) {
    item.quantity = newQuantity;
    notifyListeners();
    _saveData();
  }


  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    final itemsJson = inventoryItems.map((item) => item.toJson()).toList();
    await prefs.setString('inventoryItems', jsonEncode(itemsJson));
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final itemsJson = prefs.getString('inventoryItems');

    if (itemsJson != null) {
      final List<dynamic> decodedJson = jsonDecode(itemsJson);
      inventoryItems = decodedJson
          .map((item) => InventoryItem.fromJson(item))
          .toList();
      notifyListeners();
    }
  }
}



    // --- 2nd page ---//
// --- Manage Items Page ---//
class ManageItemsPage extends StatefulWidget {
  const ManageItemsPage({super.key});

  @override
  ManageItemsPageState createState() => ManageItemsPageState();
}


class ManageItemsPageState extends State<ManageItemsPage> {
  final _itemNameController = TextEditingController();
  final _itemQuantityController = TextEditingController();
  final _itemPriceController = TextEditingController();
  String? _newItemImagePath;

  @override
  Widget build(BuildContext context) {
    return Consumer<InventoryModel>(
      builder: (context, inventoryModel, child) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false, // Hide the back button
            toolbarHeight: 30,
          ),
          body: Column(
            children: [
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  "Inventory Items",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Expanded(
                child: ListView.builder(
                  itemCount: inventoryModel.inventoryItems.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ItemDetailsPage(
                                item: inventoryModel.inventoryItems[index]),
                          ),
                        );
                      },
                      child: Card(
                        color: const Color(0xFFF1F1F1),
                        margin: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 20),
                        child: ListTile(
                          title: Text(
                            inventoryModel.inventoryItems[index].name,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          trailing: Text(
                            "${inventoryModel.inventoryItems[index].quantity}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),



              // Add Item Button
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 10, left: 20, right: 20),
                child: SizedBox(
                  width: 200, // Adjust width as needed
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF1F1F1),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      textStyle: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF579008),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      _showAddItemDialog(context);
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add,
                            size: 18, color: Color(0xFF579008)),
                        SizedBox(width: 8),
                        Text("Add item"),
                      ],
                    ),
                  ),
                ),
              ),

              // Back Button
              Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF579008),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      textStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Back"),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }




  // --- Add Item Dialog --- //
  void _showAddItemDialog(BuildContext context) async {
    _itemNameController.clear();
    _itemQuantityController.clear();
    _itemPriceController.clear();
    _newItemImagePath = null;

    await showDialog<void>(
      context: context,
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
          builder: (context, setState) => AlertDialog(
            title: const Text('Add Item'),
            content: SingleChildScrollView(  // Add SingleChildScrollView
              child: Column(
                mainAxisSize: MainAxisSize.min,  // Important for SingleChildScrollView
                children: [
                  TextField(
                    controller: _itemNameController,
                    decoration: const InputDecoration(labelText: 'Name'),
                  ),
                  TextField(
                    controller: _itemQuantityController,
                    decoration: const InputDecoration(labelText: 'Quantity'),
                    keyboardType: TextInputType.number,
                  ),
                  TextField(
                    controller: _itemPriceController,
                    decoration: const InputDecoration(labelText: 'Price'),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                  ),
                  GestureDetector(
                    onTap: () async {
                      final XFile? image = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      if (image != null) {
                        setState(() {
                          _newItemImagePath = image.path;
                        });
                      }
                    },
                    child: _newItemImagePath != null
                        ? Image.file(File(_newItemImagePath!))
                        : const SizedBox(
                            height: 200,
                            child: Center(
                              child: Icon(Icons.image,
                                  size: 60, color: Colors.grey),
                            ),
                          ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  final itemName = _itemNameController.text;
                  final quantityText = _itemQuantityController.text;
                  final priceText = _itemPriceController.text;

                  if (itemName.isNotEmpty &&
                      quantityText.isNotEmpty &&
                      priceText.isNotEmpty) {
                    final quantity = int.tryParse(quantityText);
                    final price = double.tryParse(priceText);

                    if (quantity != null && price != null) {
                      final newItem = InventoryItem(
                        name: itemName,
                        quantity: quantity,
                        price: price,
                        imagePath: _newItemImagePath,
                      );
                      if (mounted) {  // Check if the widget is still mounted
                        Provider.of<InventoryModel>(context, listen: false)
                            .addItem(newItem);
                        Navigator.of(dialogContext).pop();
                      }
                    } else {
                      _showErrorDialog(dialogContext,
                          'Invalid input for quantity or price.');
                    }
                  } else {
                    _showErrorDialog(
                        dialogContext, 'Please fill in all fields.');
                  }
                },
                child: const Text('Add'),
              ),
            ],
          ),
        );
      },
    );
  }



  // Error Dialog
  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}





class ItemDetailsPage extends StatefulWidget {
  final InventoryItem item;

  const ItemDetailsPage({super.key, required this.item});

  @override
  State<ItemDetailsPage> createState() => _ItemDetailsPageState();
}

class _ItemDetailsPageState extends State<ItemDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final double totalItemValue = widget.item.quantity * widget.item.price;

    return Scaffold(
      appBar: AppBar(title: Text(widget.item.name), automaticallyImplyLeading: false,),
      body: SingleChildScrollView( // Wrap with SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () async {
                  final XFile? image = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    if (mounted) { // Check if widget is still mounted
                      setState(() {
                        widget.item.imagePath = image.path;
                      });
                    }

                    Provider.of<InventoryModel>(context, listen: false)
                        ._saveData(); // Save data when image is changed
                  }
                },
                child: widget.item.imagePath != null
                    ? Image.file(File(widget.item.imagePath!))
                    : const SizedBox(
                        height: 200,
                        child: Center(
                          child: Icon(Icons.image,
                              size: 60, color: Colors.grey),
                        ),
                      ),
              ),

              const SizedBox(height: 20),


              Text(widget.item.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(height: 20),


              const Text("Total Item Value",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(height: 10),


              Text("₱ ${totalItemValue.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF579008),
                  )),
              const SizedBox(height: 20),


              _buildDetailRow(
                  "Value per Item", "₱ ${widget.item.price.toStringAsFixed(2)}"),
              _buildDetailRow("VAT per Item", "₱ 5.00"),
              _buildDetailRow("Items in stock", "${widget.item.quantity}"),
              const SizedBox(height: 40),


              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF1F1F1),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF579008),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    _showEditQuantityDialog(context);
                  },
                  child: const Text("Edit item"),
                ),
              ),
              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF579008),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Back"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 16)),
          Text(value, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }


  void _showEditQuantityDialog(BuildContext context) async {
    final initialQuantity = widget.item.quantity;
    int? newQuantity;

    final result = await showDialog<int?>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Edit Quantity'),
          content: TextFormField(
            initialValue: initialQuantity.toString(),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              newQuantity = int.tryParse(value);
            },
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (newQuantity != null) {
                  Navigator.pop(dialogContext, newQuantity);
                } else {
                  // Show error if newQuantity is not a valid int
                  showDialog(
                    context: dialogContext,
                    builder: (BuildContext errorContext) {
                      return AlertDialog(
                        title: const Text("Invalid Input"),
                        content:
                            const Text("Please enter a valid integer."),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(errorContext).pop();
                            },
                            child: const Text("OK"),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );

    if (result != null && mounted) { 
      setState(() {  
        Provider.of<InventoryModel>(context, listen: false)
            .updateQuantity(widget.item, result);
      });
    }
  }
}