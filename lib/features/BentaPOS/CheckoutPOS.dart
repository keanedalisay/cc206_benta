import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
              top: 22,  // Position updated for checkout image
              left: 230, // Moved further to the right
              child: Image.asset(
                'assets/images/POS_checkout.png',
                width: 137,  // Width updated
                height: 30,  // Height updated
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 56,  // Moved up more
              left: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Net Total',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF579008),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '₱120.00',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                      color: Color(0xFF579008),
                    ),
                  ),
                  SizedBox(height: 16), // Add some space between amount and transaction details
                  Text(
                    'Transaction Date: 01/01/2024',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF787878),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Transaction ID: AFD1-3451',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF787878),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 250,  // Moved up even more
              left: (MediaQuery.of(context).size.width / 2) - 130,
              child: Container(
                width: 260,
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
            ),
            Positioned(
              top: 275,  // Moved up even more
              left: 75,  // Slightly moved to the right
              child: Container(
                width: 240,  // Specified width
                height: 28,  // Specified height
                child: Text(
                  'Choose a payment channel:',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF212121),
                    height: 19.36 / 16,  // Line height relative to font size
                    decoration: TextDecoration.none,  // Remove invalid decorationSkipInk
                  ),
                  textAlign: TextAlign.left, // Text alignment here
                ),
              ),
            ),
            Positioned(
              top: 320,  // Added a gap here to separate the button further from the text
              left: 60,  // Slightly moved to the right
              child: SizedBox(
                width: 246,  // Specified width
                height: 45,  // Specified height
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF1F1F1), // Light grey background for Cash on-hand
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // Apply consistent radius
                    ),
                    shadowColor: Colors.transparent, // Remove any shadow to maintain transparency
                  ),
                  child: Text(
                    'Cash on-hand',
                    style: TextStyle(
                      color: Color(0xFF579008), // Text color set to green
                      fontWeight: FontWeight.bold, // Make the text bold
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 390,  // Adjusted position for Debit/Credit button
              left: 60,  // Slightly moved to the right
              child: SizedBox(
                width: 246,  // Specified width
                height: 45,  // Specified height
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF1F1F1), // Light grey background for Debit/Credit
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // Apply consistent radius
                    ),
                    shadowColor: Colors.transparent, // Remove any shadow to maintain transparency
                  ),
                  child: Text(
                    'Debit/Credit',
                    style: TextStyle(
                      color: Color(0xFF579008), // Text color set to green
                      fontWeight: FontWeight.bold, // Make the text bold
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
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
                child: Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Back to transaction',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Inter',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
