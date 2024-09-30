import 'package:flutter/material.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.grey,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Log In', style: TextStyle(color: Colors.white)),
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
              const Text(
                'Log Into Your Account',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: const Text('Log In'),
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Don\'t have an account? Sign Up',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const Spacer(),
              Container(
                height: 50,
                color: Colors.black,
                child: Center(
                  child: const Text(
                    'Log-in',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}