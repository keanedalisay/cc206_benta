import 'package:flutter/material.dart';

class SignUpPage3 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xFF579008),
      body: Padding(
        padding: const EdgeInsets.all(45.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              const SizedBox(height: 80),

              Container(
                width: 300,
                height: 300,
                child: Image.asset(
                  'assets/images/benta_logo.png',
                  fit: BoxFit.cover,
                ),
              ),

              const Text(
                  "Creating",
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  )
              ),

              const SizedBox(height: 20),

              const Text(
                  "your business and user account...",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white
                  )
              ),

            ]
        ),
      ),
    );
  }
}
