import 'package:flutter/material.dart';

class LoadingPOS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF579008),
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                Center(
                  child: Image.asset(
                    'assets/images/benta_logo-white.png',
                    width: 100,
                    height: 100,
                  ),
                ),
              ],
            ),
            Positioned(
              top: 153,
              left: 0,
              right: 0,
              child: Center(
                child: Opacity(
                  opacity: 1.0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/POS_white.png',
                        width: 150,
                        height: 150,
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: 238,
                        height: 56,
                        alignment: Alignment.center,
                        child: Text(
                          "Preparing",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                            height: 48.41 / 40,
                            color: Color(0xFFFFFFFF),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: 267,
                        height: 37,
                        alignment: Alignment.center,
                        child: Opacity(
                          opacity: 1.0,
                          child: Text(
                            "your first transaction...",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              height: 29.05 / 24,
                              color: Color(0xFFFFFFFF),
                            ),
                            textAlign: TextAlign.center,
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
