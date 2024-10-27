import 'package:flutter/material.dart';
import 'package:cc206_benta/features/BentaSignUp/SignUpPage2.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF579008),
      body: Padding(
        padding: const EdgeInsets.all(45.0),
        child:
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          
              Center(
                child: Container(
                  width: 100,
                  height: 100,
                  child: Image.asset(
                    'assets/images/benta_logo.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
          
              const SizedBox(height: 30),
          
              const Text(
                'Sign-up',
                style: TextStyle(
                    fontSize: 44,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                ),
              ),
          
              const Text(
                'Step 1',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
              ),
          
              const SizedBox(height: 40),
          
              const Text(
                'What is the name of your business?',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
          
              const SizedBox(height: 12),
          
              // TextFormField for Email
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
          
              const SizedBox(height: 40),
          
              const Text(
                'What is your user name?',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
          
              const SizedBox(height: 12),
              // TextFormField for Password
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
          
              const SizedBox(height: 60),
          
              // Sign Up Button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage2()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(120, 55),
                  backgroundColor: Colors.grey[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    side: BorderSide.none,
                  ),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
            ),
          ],
          ),
        ),
      ),
    );
  }
}