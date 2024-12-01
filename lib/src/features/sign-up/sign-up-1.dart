import 'package:cc206_benta/src/features/sign-up/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:cc206_benta/src/features/sign-up/auth_service.dart';
import 'package:email_validator/email_validator.dart';
import 'package:cc206_benta/src/features/sign-up/sign-up-2.dart';

class SignUp1 extends StatefulWidget {
  const SignUp1({super.key});

  @override
  _SignUp1State createState() => _SignUp1State();
}

class _SignUp1State extends State<SignUp1> {

  @override
  Widget build(BuildContext context) {

    final _formKey = GlobalKey<FormState>();
    final _businessName = TextEditingController();
    final _email = TextEditingController();

    @override
    void dispose(){
      super.dispose();
      _businessName.dispose();
      _email.dispose();
    }

    return Scaffold(
      backgroundColor: Color(0xFF579008),
      body: Padding(
        padding: const EdgeInsets.all(45.0),
        child:
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    child: Image.asset(
                      'assets/images/benta_logo_single_letter_80_x_80.png',
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

                // TextFormField for Business Name
                TextFormField(
                  controller: _businessName,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the name of your business';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 40),

                const Text(
                  'What is your email?',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),

                const SizedBox(height: 12),
                // TextFormField for Password
                TextFormField(
                  controller: _email,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!EmailValidator.validate(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  }
                ),

                const SizedBox(height: 60),

                // Sign Up Button
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()){
                      Navigator.pushNamed(
                        context,
                        '/sign-up/password',
                        arguments: {'email': _email.text.trim()},
                      );
                    }
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
      ),
    );
  }
}
