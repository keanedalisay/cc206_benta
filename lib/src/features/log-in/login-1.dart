import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cc206_benta/src/features/log-in/login-2.dart';
import 'package:cc206_benta/src/features/sign-up/auth_service.dart';

class LogIn1 extends StatefulWidget{
  const LogIn1({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LogIn1> {

  final _email = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;


  Future<bool> _checkUserExists(String email) async {
    try {
      final signInMethods = await _auth.fetchSignInMethodsForEmail(email.toLowerCase());
      debugPrint('Sign-in methods for $email: $signInMethods');
      return signInMethods.isNotEmpty;
    } catch (e) {
      debugPrint('Error checking user existence: ${e.toString()}');
      return false;
    }
  }

  void _onNextPressed() async {
    if (_formKey.currentState!.validate()) {
      final email = _email.text.trim().toLowerCase();
      final userExists = await _checkUserExists(email);

      if (userExists) {
        Navigator.pushNamed(
          context,
          '/log-in/password',
          arguments: {'email': email},
        );
      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Account not found. Please try again."),
          ),
        );
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color.fromRGBO(87, 144, 8, 1),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Image.asset(
                'assets/images/benta_logo_single_letter_80_x_80.png',
                width: 80,
                height: 80,
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 200, 0),
                      child: Text(
                        'Log-in',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          height: 48.41 / 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 200, 0),
                      child: Text(
                        'Step 1',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          height: 29.05 / 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Form(
                  key: _formKey,
                  child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "What is your business's\naccount ID?",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 19.36 / 16,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 350,
                        height: 88,
                        child: TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 20,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "What is your email?",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 19.36 / 16,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 350,
                        height: 88,
                        child: TextFormField(
                          controller: _email,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 20,
                            ),
                          ),
                          validator: (value){
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            } else if (!EmailValidator.validate(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 75, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed:  _onNextPressed,
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(120, 55),
                        backgroundColor: Colors.white, 
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                      ),
                      child: const Text(
                        'Next',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          height: 19.36 / 16,
                          color: Colors.black, 
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
