import 'package:flutter/material.dart';

import 'package:cc206_benta/src/features/dashboard/dashboard.dart';

class LoggingInAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => Dashboard()
          )
      );
    });

    return Scaffold(
      backgroundColor: const Color(0xFF579008),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.sizeOf(context).height,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(45.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                child: Image.asset(
                  'assets/images/benta_logo_single_letter_200_x_200.png',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Logging-in",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  height: 1.21, // Equivalent to line-height of 48.41px
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "your user account...",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  height: 1.21, // Equivalent to line-height of 29.05px
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
