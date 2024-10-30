import 'package:flutter/material.dart';

class PointOfSale extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: Scaffold(
        backgroundColor: Color(0xFFFFFFFF), 
        body: Stack(
          children: [
            // Header image
            Positioned(
              top: 26,
              right: 15,
              child: Image.asset(
                'assets/images/POS_header.png',
                width: 152,
                height: 30,
                fit: BoxFit.cover,
              ),
            ),
            // Net total text
            Positioned(
              top: 66,
              left: 15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Net Total',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Inter',
                      color: Color(0xFF579008),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '₱120,00',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                      color: Color(0xFF579008),
                    ),
                  ),
                ],
              ),
            ),
            // Buttons
            Positioned(
              top: 185,
              left: (MediaQuery.of(context).size.width / 2) - (122 + 8),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  width: 122,
                  height: 40,
                  child: Image.asset(
                    'assets/images/Add-items.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 185,
              left: (MediaQuery.of(context).size.width / 2) + 8,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  width: 122,
                  height: 40,
                  child: Image.asset(
                    'assets/images/Scan-items.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // Transaction details
            Positioned(
              top: 272,
              left: (MediaQuery.of(context).size.width / 2) - 125.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Transaction Date: 01/01/2024',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Inter',
                      color: Color(0xFF787878),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Transaction ID: ABCD-1234',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Inter',
                      color: Color(0xFF787878),
                    ),
                  ),
                ],
              ),
            ),
            // Images
            Positioned(
              top: 337,
              left: (MediaQuery.of(context).size.width / 2) - 133,
              child: Container(
                width: 266,
                height: 69,
                child: Image.asset(
                  'assets/images/mango_yogurt.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 420,
              left: (MediaQuery.of(context).size.width / 2) - 133,
              child: Container(
                width: 266,
                height: 69,
                child: Image.asset(
                  'assets/images/milk_cake.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Bottom navigation bar
            Positioned(
              bottom: 0,
              left: (MediaQuery.of(context).size.width / 2) - 160,
              child: Container(
                width: 320,
                height: 75,
                decoration: BoxDecoration(
                  color: Color(0xFF579008),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Inter',
                          color: Colors.white,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Checkout',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Inter',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
