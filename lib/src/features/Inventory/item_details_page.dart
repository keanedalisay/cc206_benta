import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'inventory_models.dart'; 

class ItemDetailsPage extends StatefulWidget {
  final InventoryItem item;

  const ItemDetailsPage({super.key, required this.item});

  @override
  State<ItemDetailsPage> createState() => _ItemDetailsPageState();
}

class _ItemDetailsPageState extends State<ItemDetailsPage> {
      // Controllers for editing
  late TextEditingController _nameController;
  late TextEditingController _brandController;
  late TextEditingController _quantityController;
  late TextEditingController _priceController;
  late TextEditingController _weightController;
  late TextEditingController _vatController;
  late TextEditingController _categoryController;
  late TextEditingController _minStockController;


  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.item.name);
    _brandController = TextEditingController(text: widget.item.brand);
    _quantityController = TextEditingController(text: widget.item.quantity.toString());
    _priceController = TextEditingController(text: widget.item.price.toString());
    _weightController = TextEditingController(text: widget.item.weight.toString());
    _vatController = TextEditingController(text: widget.item.vat.toString());
    _categoryController = TextEditingController(text: widget.item.category);
    _minStockController = TextEditingController(text: widget.item.minStock.toString());

  }

  @override
  void dispose() {
    _nameController.dispose();
    _brandController.dispose();
    _quantityController.dispose();
    _priceController.dispose();
    _weightController.dispose();
    _vatController.dispose();
    _categoryController.dispose();
    _minStockController.dispose();
    super.dispose();
  }
    
@override
  Widget build(BuildContext context) {
    final inventoryModel = Provider.of<InventoryModel>(context, listen: false);
    final double totalItemValue = widget.item.quantity * widget.item.price;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item.name),
        automaticallyImplyLeading: false, 
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => _showEditItemDialog(context), 
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () async {
                  final XFile? image =
                      await ImagePicker().pickImage(source: ImageSource.gallery);
                  if (image != null && mounted) {
                    setState(() {
                      inventoryModel.updateItemImage(widget.item, image.path);
                    });
                    inventoryModel._saveData();
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

              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,          
                children: [
                  Text(widget.item.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      )),
                  const SizedBox(width: 10),
                  Text(widget.item.brand,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black54,
                      )),
                ],
              ),

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
                    color:  Color(0xFF579008),
                  )),

              const SizedBox(height: 20),

              _buildDetailRow("Value per Item", "₱ ${widget.item.price.toStringAsFixed(2)}"), 
              _buildDetailRow("VAT per Item", "₱ ${widget.item.vat.toStringAsFixed(2)}"), 
              _buildDetailRow("Items in stock", "${widget.item.quantity}"),
              _buildDetailRow("Item Weight", widget.item.weight), 
              _buildDetailRow("Item Category", widget.item.category), 
              _buildDetailRow("Minimum Stock", "${widget.item.minStock}"),  

              const SizedBox(height: 40),


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

  void _showEditItemDialog(BuildContext context) async {
    final inventoryModel = Provider.of<InventoryModel>(context, listen: false);

    await showDialog<void>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Edit Item'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: _brandController,
                  decoration: const InputDecoration(labelText: 'Brand'),
                ),                
                TextField(
                  controller: _quantityController,
                  decoration: const InputDecoration(labelText: 'Quantity'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: _priceController,
                  decoration: const InputDecoration(labelText: 'Price'),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                ),
                TextField(
                  controller: _weightController,
                  decoration: const InputDecoration(labelText: 'Weight'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: _vatController,
                  decoration: const InputDecoration(labelText: 'VAT'),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),

                ),
                TextField(
                  controller: _categoryController,
                  decoration: const InputDecoration(labelText: 'Category'),
                ),
                TextField(
                  controller: _minStockController,
                  decoration: const InputDecoration(labelText: 'Min Stock'),
                  keyboardType: TextInputType.number,
                ),
               
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {

                  final updatedItem = InventoryItem(
                  name: _nameController.text,
                  brand: _brandController.text,
                  quantity: int.parse(_quantityController.text),
                  price: double.parse(_priceController.text),
                  weight: _weightController.text, 
                  vat: double.parse(_vatController.text),
                  category: _categoryController.text,
                  minStock: int.parse(_minStockController.text),
                    imagePath: widget.item.imagePath,
                    );
                inventoryModel.updateItem(widget.item, updatedItem);
                  Navigator.of(dialogContext).pop(); 

              },
            ),
          ],
        );
      },
    );

     setState(() {}); 
  }

}

extension on InventoryModel {
  void _saveData() {} 
}
