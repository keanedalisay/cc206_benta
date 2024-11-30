import 'package:flutter/material.dart';
import 'package:cc206_benta/src/shared-components/custom-widgets/general-bottom-nav-bar.dart';
import 'package:cc206_benta/src/shared-components/custom-widgets/general-top-nav-label.dart';
import 'package:cc206_benta/src/shared-components/custom-widgets/general-text-button.dart';
import 'package:cc206_benta/src/shared-components/custom-widgets/pos-transaction-item-button.dart';

class Checkout1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
              child: Container(
                height: MediaQuery.sizeOf(context).height,
                margin: EdgeInsets.only(bottom: 90),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          GeneralTopNavLabel(label: 'Point-of-sale', iconName: 'cash-register.png'),
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
                              SizedBox(height: 30),
                              Container(
                                width: double.infinity,
                                child: Flex(
                                    direction: Axis.vertical,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text('Choose a payment channel:'),
                                      SizedBox(height: 10),
                                      GeneralTextButton(
                                          label: 'Cash on hand',
                                          color: Color(0xFF579008),
                                          backgroundColor: Color(0xFFF1F1F1),
                                          onPressed: () => Navigator.pushNamed(context, '/dashboard/point-of-sale/checkout/2')
                                      ),
                                      SizedBox(height: 5),
                                      GeneralTextButton(
                                          label: 'Debit/Credit',
                                          color: Color(0xFF579008),
                                          backgroundColor: Color(0xFFF1F1F1),
                                          onPressed: () {}
                                      ),
                                    ])
                              )
                            ],
                            ),
                          ),
                      ]
                  )
              )
          ),
          GeneralBottomNavBar(navItems: 1, navLabels: [
            "Back"
          ], navActions: [
            () => Navigator.pushNamed(context, '/dashboard/point-of-sale')
          ])
        ],
      ),
    );
  }
}
