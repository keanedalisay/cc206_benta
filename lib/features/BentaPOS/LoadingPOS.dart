import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF579008), // Set background color
        body: Stack(
          children: [
            // First image centered at the top
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50), // Spacing from the top of the screen
                Center(
                  child: Image.asset(
                    'assets/images/benta_logo-white.png', // Reference to the top PNG image
                    width: 100, // Increased width
                    height: 100, // Increased height
                  ),
                ),
              ],
            ),

            // Second image (POS_white.png) positioned below the first image, centered horizontally
            Positioned(
              top: 153,
              left: 0, // Start from the left
              right: 0, // End at the right to center horizontally
              child: Center(
                child: Opacity(
                  opacity: 1.0, // Fully visible
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // Take minimum space
                    children: [
                      Image.asset(
                        'assets/images/POS_white.png', // Reference to the POS_white image
                        width: 150, // Increased width
                        height: 150, // Increased height
                      ),
                      SizedBox(height: 10), // Space between image and text
                      // Text container for "Preparing"
                      Container(
                        width: 238, // Width of the text container
                        height: 56, // Height of the text container
                        alignment: Alignment.center, // Center the text
                        child: Text(
                          "Preparing", // Text to display
                          style: TextStyle(
                            fontFamily: 'Inter', // Font family
                            fontSize: 40, // Font size
                            fontWeight: FontWeight.w700, // Font weight
                            height: 48.41 / 40, // Line height ratio (for correct spacing)
                            color: Color(0xFFFFFFFF), // Text color set to white (#ffffff)
                          ),
                          textAlign: TextAlign.center, // Center align the text
                        ),
                      ),
                      SizedBox(height: 10), // Space between the two text elements
                      // Additional text "your first transaction..."
                      Container(
                        width: 267, // Updated width as per your requirement
                        height: 37, // Height of the text container
                        alignment: Alignment.center, // Center the text
                        child: Opacity(
                          opacity: 1.0, // Set opacity to 1 for visibility
                          child: Text(
                            "your first transaction...", // Additional text
                            style: TextStyle(
                              fontFamily: 'Inter', // Font family
                              fontSize: 24, // Font size
                              fontWeight: FontWeight.w400, // Font weight (normal)
                              height: 29.05 / 24, // Line height ratio (for correct spacing)
                              color: Color(0xFFFFFFFF), // Text color set to white (#ffffff)
                            ),
                            textAlign: TextAlign.center, // Center align the text
                          ),
                        ),
                      ),
                    ],
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
