import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart'; 
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final logger = Logger(); //  a logger instance

class InventoryApp extends StatelessWidget {
  const InventoryApp({super.key});

  //AppBar
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset('assets/frame.png', height: 24,),
              const SizedBox(
                height: 20,
                width: 15,
              ),
              const Text("Inventory",
                  style: TextStyle(fontSize: 25,
                      color: Color(0xFF787878),
                      fontWeight: FontWeight.w500)
              )
            ],
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),

        
        //place holder nav bar
        body: const InventoryScreen(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            logger.d('Tapped index: $index');
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.inventory_2),
              label: 'Inventory',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: 'Sales',
            ),
          ],
        ),
      ),
    );
  }
}

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Total Inventory Value
          const Text(
            "Total Inventory Value",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF579008),
              height: (100 / 150.0),
            ),
          ),
          const SizedBox(height: 0),
          Consumer<InventoryModel>( // Use Consumer to get total value
                builder: (context, inventoryModel, child) {

                  // Calculate total value here

                  double totalValue = 0;
                  for (var item in inventoryModel.inventoryItems) {

                    // Assuming each item has a price of 35.30

                    totalValue += item.quantity * 35.30;
                  }
                  return Text(
                    "₱ ${totalValue.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF579008),
                    ),
                  );
                },
              ),
          const SizedBox(height: 30),

          // Low Inventory Levels

          const Center(
            child: Text(
              "Low Inventory Levels",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                height: (100 / 1500.0),
                color: Color(0xFF787878),
              ),
            ),
          ),
          const SizedBox(height: 23),

          // inventory items

          Expanded(
            child: Consumer<InventoryModel>(
              builder: (context, inventoryModel, child) {
                return ListView.builder(
                  itemCount: inventoryModel.inventoryItems.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.pink[50],
                      elevation: 10,
                      child: _buildInventoryItem(
                        inventoryModel.inventoryItems[index].name,
                        inventoryModel.inventoryItems[index].quantity,
                      ),
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 44),

          // Manage Items Button

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () {

                // Navigate to the ManageItemsPage

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
  }

  Widget _buildInventoryItem(String name, int quantity) {
    return ListTile(
      title: Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.w700),
      ),
      trailing: Text(
        "$quantity",
        style: const TextStyle(fontSize: 15),
      ),
    );
  }
}

class InventoryItem {
  final String name;
  final int quantity;

  InventoryItem({required this.name, required this.quantity});
}

// InventoryModel (ChangeNotifier) //

class InventoryModel extends ChangeNotifier {
  final List<InventoryItem> _inventoryItems = [
    InventoryItem(name: "CDO Corned Beef", quantity: 5),
    InventoryItem(name: "Holiday Beef Loaf", quantity: 5),
    InventoryItem(name: "UFC Canola Oil", quantity: 6),
    InventoryItem(name: "Coco Mama Coconut Milk", quantity: 6),
    InventoryItem(name: "Lucky Me Pancit Canton", quantity: 10),
  ];

  List<InventoryItem> get inventoryItems => _inventoryItems;

  void updateQuantity(InventoryItem item, int newQuantity) {
    final index = _inventoryItems.indexOf(item);
    if (index != -1) {
      _inventoryItems[index] = InventoryItem(
        name: item.name,
        quantity: newQuantity,
      );
      notifyListeners();
    }
  }
}

class ManageItemsPage extends StatelessWidget {
  const ManageItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 30,
      ),

        // Use Consumer to access inventoryItems
      body: Consumer<InventoryModel>( 
        builder: (context, inventoryModel, child) {
          return Column(
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
                                fontWeight: FontWeight.w600
                            ),
                          ),
                          trailing: Text(
                            "${inventoryModel.inventoryItems[index].quantity}",
                            style: const TextStyle(color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // FloatingActionButton above the Back button
              Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
                child: SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF1F1F1),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12),
                      textStyle: const TextStyle(fontSize: 14,
                          color: Color(0xFF579008),
                          fontWeight: FontWeight.bold),
                    ),


                    //add item // placeholder
                    onPressed: () {
                      // Handle "Add item" button press
                    },


                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add, size: 18, color: Color(0xFF579008),),
                        SizedBox(width: 8),
                        Text("Add item"),
                      ],
                    ),
                  ),
                ),
              ),

              // Back button
              Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF579008),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      textStyle: const TextStyle(fontSize: 16,
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Back",),
                  ),
                ),
              ),
            ],
          );
        },
      ),
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
  String? _imagePath;

  @override
  void initState() {
    super.initState();
    _loadSavedImage();
  }

  @override
  Widget build(BuildContext context) {
    final double totalItemValue = widget.item.quantity * 35.30;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () async {
                  final XFile? image = await ImagePicker().pickImage(
                      source: ImageSource.gallery);
                  if (image != null) {
                    setState(() {
                      _imagePath = image.path;
                    });
                    _saveImage(_imagePath!); //image path
                  }
                },
                child: _imagePath != null
                    ? Image.file(File(_imagePath!))
                    : const SizedBox(
                  height: 200,
                  child: Center(
                    child: Icon(Icons.image, size: 60, color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                widget.item.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Total Item Value",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "₱ ${totalItemValue.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF579008),
                ),
              ),
              const SizedBox(height: 20),
              _buildDetailRow("Value per Item", "₱ 35.30"),
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
                  child: const Text("Cancel"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to load the saved image
  void _loadSavedImage() async {
    final prefs = await SharedPreferences.getInstance();
    final savedImagePath = prefs.getString('${widget.item.name}_image');
    if (savedImagePath != null) {
      setState(() {
        _imagePath = savedImagePath;
      });
    }
  }

  // Function to save the image path
  void _saveImage(String imagePath) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('${widget.item.name}_image', imagePath);
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

void _showEditQuantityDialog(BuildContext context) async {
  final initialQuantity = widget.item.quantity;
  int? newQuantity;

  await showDialog<int>(
    context: context,
    builder: (BuildContext context) {
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
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (newQuantity != null) {
                Navigator.of(context).pop(newQuantity);
              } else {
                // Handle the case where the user enters an invalid quantity
                // For example, show an error message or keep the original quantity
                // to be work on pa
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Invalid Input'),
                      content: const Text('Please enter a valid integer quantity.'),
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
            },
            child: const Text('Save'),
          ),
        ],
      );
    },
  );
if (newQuantity != null) {
  // ignore: use_build_context_synchronously
  // null returns and !int return fall back ig...
  Provider.of<InventoryModel>(context, listen: false)
      .updateQuantity(widget.item, newQuantity!);
} else {
  logger.e('Invalid quantity entered.');
}
}
}
