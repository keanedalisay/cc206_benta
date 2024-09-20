import 'package:flutter/material.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                'https://static.thenounproject.com/png/736545-200.png',
                height: 100,
                width: 100,
              ),
            ),
            const SizedBox(height: 20),

            // Title for the page
            const Text(
              'Log Into Your Account',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // TextFormField for Email
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // TextFormField for Password
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),

            // Log In Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Add Log-In logic
                },
                child: const Text('Log In'),
              ),
            ),

            // Option for creating an account
            Center(
              child: TextButton(
                onPressed: () {
                  // TODO: Navigate to Sign Up page
                },
                child: const Text('Don\'t have an account? Sign Up'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
