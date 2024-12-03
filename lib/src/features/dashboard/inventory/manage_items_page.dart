import 'dart:io';
import 'package:cc206_benta/src/shared-components/custom-widgets/general-bottom-nav-bar.dart';
import 'package:cc206_benta/src/shared-components/custom-widgets/general-text-button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'inventory_models.dart';
import 'item_details_page.dart';

class ManageItemsPage extends StatefulWidget {
  const ManageItemsPage({super.key});

  @override
  ManageItemsPageState createState() => ManageItemsPageState();
}

class ManageItemsPageState extends State<ManageItemsPage> {
  final _itemNameController = TextEditingController();
  final _itemBrandController = TextEditingController();
  final _itemQuantityController = TextEditingController();
  final _itemPriceController = TextEditingController();
  final _itemWeightAndUnitController = TextEditingController();
  final _itemVatController = TextEditingController();   
  final _itemCategoryController = TextEditingController();
  final _itemMinStockController = TextEditingController();
  
  bool _isDeleteMode = false;
  List<InventoryItem> _selectedItems = [];
  List<InventoryItem> _sortedItems = [];
  String? _newItemImagePath;

  String _sortType = 'asc';

   @override
  Widget build(BuildContext context) {
    final inventoryModel = Provider.of<InventoryModel>(context);

    // Sorting mechanism based on the sort order
    if(_sortType == 'desc'){
        _sortedItems = inventoryModel.inventoryItems.toList()..sort((a,b) => b.quantity.compareTo(a.quantity));
    }else {
      _sortedItems = inventoryModel.inventoryItems.toList()..sort((a, b) => a.quantity.compareTo(b.quantity));
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 20),
              const Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Inventory Items',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF212121)
                    )
                  ),
                ),
              ),
              Expanded( // Icon Button
                child: Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: _isDeleteMode
                        ? const Icon(Icons.check_circle)
                        : const Icon(Icons.delete_outline),
                    onPressed: () {
                      setState(() {
                        _isDeleteMode = !_isDeleteMode;
                        if (!_isDeleteMode) {
                          _selectedItems = [];
                        }
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          //Delete Button
          if (_isDeleteMode)
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              color: Color(0xFFC70000),
              child: GestureDetector(
                onTap: _deleteSelectedItems,
                child: const Text("Delete Selected",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFFFFFFF),
                    )
                ),
              ),
            ),
          _buildSortDropdown(inventoryModel), // Sort dropdown
          Expanded(
            child: ListView.builder(
              itemCount: _sortedItems.length,
              itemBuilder: (context, index) {
                final item = _sortedItems[index];
                final isSelected = _selectedItems.contains(item);

                return InkWell(
                  onTap: () {
                    if (_isDeleteMode) {
                      setState(() {
                        if (_selectedItems.contains(item)) {
                          _selectedItems.remove(item);
                        } else {
                          _selectedItems.add(item);
                        }
                      });
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ItemDetailsPage(item: item),
                        ),
                      );
                    }
                  },

                  child: IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Card(
                            color: isSelected ? Color(0xFFC70000) : Color(0xFFF1F1F1),
                            margin: const EdgeInsets.only(left: 10, top: 10,),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              bottomLeft: Radius.circular(8.0),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${item.weight} • ${item.brand}",
                                    style: TextStyle(
                                      color: isSelected ? Color(0xFFFFFFFF) : Color(0xFF212121),
                                    )
                                  ),
                                  Text(item.name,
                                    style: TextStyle(
                                      color: isSelected ? Color(0xFFFFFFFF) : Color(0xFF212121),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 50,
                          margin: const EdgeInsets.only(top: 10,),
                          decoration: BoxDecoration(
                            color: item.quantity <= item.minStock ? Colors.red : Colors.grey,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(8.0),
                              bottomRight: Radius.circular(8.0),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "${item.quantity}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          GeneralTextButton(
              label: 'Add Item',
              color: Color(0xFF579008),
              backgroundColor: Color(0xFFF1F1F1),
              onPressed: () => _showAddItemDialog(context)
          ),
            SizedBox(height: 30),
            // Back Button
          GeneralBottomNavBar(
              navItems: 1,
              navLabels: ['Back'],
              navActions: [
                () => Navigator.pop(context)
              ])
        ],
      ),
    );
  }









  Widget _buildSortDropdown(InventoryModel inventoryModel) {
   return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          labelText: "Sort By:",
        ),
        value: _sortType, 
        items: const [
          DropdownMenuItem(value: "asc", child: Text('Quantity Ascending')),
          DropdownMenuItem(value: "desc", child: Text('Quantity Descending')),
        ],
        onChanged: (String? newValue) {
          setState(() {
            _sortType = newValue!; 
          });
        },
      ),
    );
  }

  void _deleteSelectedItems() {
          if (_selectedItems.isEmpty) {
            return;
          }
          showDialog(
              context: context,
                builder: (context) {
                    return AlertDialog(
                      backgroundColor: Colors.white,
                      title: const Text('Delete Items?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700
                          )
                      ),
                      content: Text('Are you sure you want to delete ${_selectedItems.length} items?'),
                      actions: [
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Color(0xFF579008),
                            backgroundColor: Color(0xFFF1F1F1),
                          ),
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Color(0xFF579008),
                            backgroundColor: Color(0xFFF1F1F1),
                          ),
                          onPressed: () {
                            Provider.of<InventoryModel>(context, listen: false)
                                .deleteItems(_selectedItems);
                            setState(() {
                              _selectedItems = [];
                              _isDeleteMode = false;
                            });
                            Navigator.pop(context); 
                          },
                          child: const Text('Delete'),
                        ),
                      ],
                    );
                }
            );
 }


  // --- Add Item Dialog --- //
  void _showAddItemDialog(BuildContext context) async {
    _itemNameController.clear();
    _itemBrandController.clear();
    _itemQuantityController.clear();
    _itemPriceController.clear();
    _itemWeightAndUnitController.clear(); 
    _itemVatController.clear(); 
    _itemCategoryController.clear();  
    _itemMinStockController.clear(); 
    _newItemImagePath = null;


    await showDialog<void>(
      context: context,
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
          builder: (context, setState) => AlertDialog(
            backgroundColor: Colors.white,
            title: const Text('Add Item',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                    fontWeight: FontWeight.w700
                )
            ),
            scrollable: true,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _itemNameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: _itemBrandController,
                  decoration: const InputDecoration(labelText: 'Brand name'),
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
                TextField(
                  controller: _itemWeightAndUnitController,
                  decoration: const InputDecoration(labelText: 'Weight (e.g., 120 g, 5 kg, 10 ml) - Optional'),
                ),
                 TextField(
                  controller: _itemVatController,
                  decoration: const InputDecoration(labelText: 'VAT per item'),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                ),
                TextField(
                  controller: _itemCategoryController,
                  decoration: const InputDecoration(labelText: 'Category (e.g., Frozen, Vegetable)'),
                ),

                TextField(
                   controller: _itemMinStockController,
                   decoration: const InputDecoration(labelText: 'Minimum Stock'),
                   keyboardType: TextInputType.number,
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
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Color(0xFF579008),
                  backgroundColor: Color(0xFFF1F1F1),
                ),
                onPressed: () async  {
                  Navigator.of(dialogContext).pop();
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Color(0xFF579008),
                  backgroundColor: Color(0xFFF1F1F1),
                ),
                 onPressed: () async {
                            final itemName = _itemNameController.text;
                            final brand = _itemBrandController.text;
                            final quantityText = _itemQuantityController.text;
                            final priceText = _itemPriceController.text;
                            // final weightText = _itemWeightAndUnitController.text;
                            final vatText = _itemVatController.text;
                            final category = _itemCategoryController.text;
                            final minStockText = _itemMinStockController.text;
                          
                            if (itemName.isNotEmpty && brand.isNotEmpty && quantityText.isNotEmpty && priceText.isNotEmpty && vatText.isNotEmpty && category.isNotEmpty && minStockText.isNotEmpty){
                                    final quantity = int.tryParse(quantityText);
                                    final price = double.tryParse(priceText);
                                    final vat = double.tryParse(vatText);
                                    final minStock = int.tryParse(minStockText);

                           if (quantity !=null && price !=null && vat !=null && minStock !=null) { 
                              final newItem = InventoryItem( 
                                name: itemName,
                                brand: brand,
                                quantity: quantity,
                                price: price,
                                weight: _itemWeightAndUnitController.text,
                                vat: vat,
                                category: category,
                                minStock: minStock,
                                imagePath: _newItemImagePath,
                             );
                           
                           Provider.of<InventoryModel>(context, listen: false).addItem(newItem);
                              Navigator.pop(dialogContext);   

                           
                          
                            }else { 
                            // Await the inner showDialog call
                            await showDialog<void>(
                              context: context, 
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Error'),
                                  content: const Text("Check Input format"),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
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

     
}