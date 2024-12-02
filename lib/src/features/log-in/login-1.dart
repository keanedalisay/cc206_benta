import 'package:cc206_benta/src/shared-components/custom-widgets/general-text-button.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LogIn1 extends StatefulWidget {
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
        padding: EdgeInsets.only(left: 20, right: 20),
        color: const Color.fromRGBO(87, 144, 8, 1),
          child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40),
                  Image.asset(
                    'assets/images/benta_logo_single_letter_80_x_80.png',
                    width: 80,
                    height: 80,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: 350,
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
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
                        Container(
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
                          height: 80,
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
                  SizedBox(
                    width: 350,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GeneralTextButton(
                            label: 'Cancel',
                            color: Color(0xFFFFFFFF),
                            backgroundColor: Color(0xFF579008),
                            onPressed: () => Navigator.pop(context),
                          padding: 20
                        ),
                        GeneralTextButton(
                            label: 'Next',
                            color: Color(0xFF212121),
                            backgroundColor: Color(0xFFFFFFFF),
                            onPressed: _onNextPressed,
                            padding: 30
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                ],
              ),
          ),
      ),
    );
  }
}
