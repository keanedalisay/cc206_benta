import 'package:flutter/material.dart';
import 'package:cc206_benta/src/shared-components/custom-widgets/general-bottom-nav-bar.dart';
import 'package:cc206_benta/src/shared-components/custom-widgets/general-top-nav-label.dart';
import 'package:cc206_benta/src/shared-components/custom-widgets/general-text-button.dart';
import 'package:cc206_benta/src/shared-components/custom-widgets/pos-transaction-item-button.dart';

class PointOfSale extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(bottom: 90),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          GeneralTopNavLabel(label: 'Point-of-sale', iconName: 'grey-cash-register.png'),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Net Total',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF579008),
                                ),
                              ),
                              Text(
                                '₱120.00',
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Inter',
                                  color: Color(0xFF579008),
                                ),
                              ),
                              SizedBox(height: 10),
                              Flex(direction: Axis.horizontal,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                GeneralTextButton(
                                    label: 'Add items',
                                    color: Color(0xFF579008),
                                    backgroundColor: Color(0xFFF1F1F1),
                                    onPressed: () => Navigator.pushNamed(context, '/dashboard/point-of-sale/add-items')
                                ),
                                GeneralTextButton(
                                    label: 'Scan items',
                                    color: Color(0xFF579008),
                                    backgroundColor: Color(0xFFF1F1F1),
                                    onPressed: () => Navigator.pushNamed(context, '/dashboard/point-of-sale/scan-items')
                                ),
                              ]),
                              SizedBox(height: 20),
                              Text(
                                'Transaction Date: 01/01/2024',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF787878),
                                ),
                              ),
                              Text(
                                'Transaction ID: ABCD-1234',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF787878),
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                width: double.infinity,
                                height: 0,
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                      color: Color(0xFFF1F1F1),
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              // TODO: Height does not expand to viewport height if there are no items
                              PosTransactionItemButton(itemName: 'Mango Yogurt Smoothie', itemImg: 'image1.png', price: 70.00, onPressed: (){}),
                              PosTransactionItemButton(itemName: 'Milk Cake', itemImg: 'image6.png', price: 50.00, onPressed: (){}),
                              PosTransactionItemButton(itemName: 'Milk Cake', itemImg: 'image6.png', price: 50.00, onPressed: (){}),
                              PosTransactionItemButton(itemName: 'Milk Cake', itemImg: 'image6.png', price: 50.00, onPressed: (){}),
                              PosTransactionItemButton(itemName: 'Milk Cake', itemImg: 'image6.png', price: 50.00, onPressed: (){}),
                              PosTransactionItemButton(itemName: 'Milk Cake', itemImg: 'image6.png', price: 50.00, onPressed: (){}),
                              PosTransactionItemButton(itemName: 'Milk Cake', itemImg: 'image6.png', price: 50.00, onPressed: (){})
                            ],
                            ),
                          ),
                      ]
                  )
              )
          ),
          GeneralBottomNavBar(navItems: 2, navLabels: [
            "Cancel",
            "Checkout"
          ], navActions: [
            () => Navigator.pushNamed(context, '/dashboard'),
            () => Navigator.pushNamed(context, '/dashboard/point-of-sale/checkout/1')
          ])
        ],
      ),
    );
  }
}
