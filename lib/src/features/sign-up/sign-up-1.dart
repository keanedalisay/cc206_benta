import 'package:cc206_benta/src/features/sign-up/auth_service.dart';
import 'package:cc206_benta/src/shared-components/custom-widgets/general-text-button.dart';
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
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child:
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                Center(
                  child: Container(
                    width: 80,
                    height: 80,
                    child: Image.asset(
                      'assets/images/benta_logo_single_letter_80_x_80.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 350,
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Sign-up',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        'Step 1',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ]
                  )
                ),
                const SizedBox(height: 30),
                Container(
                  width: 350,
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'What is the name of your \nbusiness?',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      // TextFormField for Business Name
                      SizedBox(
                          width: 350,
                          height: 54,
                          child: TextFormField(
                            controller: _businessName,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 20,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the name of your business';
                              }
                              return null;
                            },
                          )
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        'What is your email?',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      const SizedBox(height: 12),
                      // TextFormField for Password
                      SizedBox(
                          width: 350,
                          height: 54,
                          child: TextFormField(
                              controller: _email,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
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
                              }
                          )
                      ),
                    ]
                  )
                ),
                const SizedBox(height: 40),
                // Sign Up Button
              Container(
                width: 350,
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GeneralTextButton(
                          label: 'Cancel',
                          color: Color(0xFFFFFFFF),
                          backgroundColor: Color(0xFF579008),
                          onPressed: () => Navigator.pop(context)
                      ),
                      GeneralTextButton(
                        label: 'Next',
                        color: Color(0xFF212121),
                        backgroundColor: Color(0xFFFFFFFF),
                        onPressed: () {
                          if (_formKey.currentState!.validate()){
                            Navigator.pushNamed(
                              context,
                              '/sign-up/password',
                              arguments: {'email': _email.text.trim()},
                            );
                          }
                        },
                        padding: 30
                        )
                    ],
                  )
              ),
                const SizedBox(height: 40),
            ],
            ),
          ),
        ),
      ),
    );
  }
}
