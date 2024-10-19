import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(45.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 70),

            const Text(
              'Sign-up',
              style: TextStyle(fontSize: 44, fontWeight: FontWeight.bold),
            ),

            const Text(
              'Step 1',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.grey),
            ),

            const SizedBox(height: 40),

            const Text(
              'What is the name of your business?',
              style: TextStyle(fontSize: 20),
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
              style: TextStyle(fontSize: 20),
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
        Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUpStep2()), // Remove extra comma here
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
              backgroundColor: Colors.grey[200],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15), // Rounded corners
                side: BorderSide.none, // Remove border
              ),
            ),
            child: const Text(
              'Next',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        ],
        ),
      ),
    );
  }
}

class SignUpStep2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(45.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 70),

            const Text(
              'Sign-up',
              style: TextStyle(fontSize: 44, fontWeight: FontWeight.bold),
            ),

            const Text(
              'Step 2',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.grey),
            ),

            const SizedBox(height: 40),

            const Text(
              'What will be your password?',
              style: TextStyle(fontSize: 20),
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
              'Confirm Your User Password',
              style: TextStyle(fontSize: 20),
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
            Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpStep2()), // Remove extra comma here
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                      backgroundColor: Colors.grey[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: BorderSide.none,
                      ),
                    ),
                    child: const Text(
                      'Finish',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),

                  const SizedBox(height: 40),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpStep2()), // Remove extra comma here
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                      backgroundColor: Colors.grey[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: BorderSide.none,
                      ),
                    ),
                    child: const Text(
                      'Back',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
