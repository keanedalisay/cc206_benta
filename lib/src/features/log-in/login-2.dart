import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:cc206_benta/src/features/sign-up/auth_service.dart';
import 'package:cc206_benta/src/features/log-in/logging-in-account.dart';

class LogIn2 extends StatefulWidget {
  const LogIn2({super.key});

  @override
 _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn2> {

  final _auth = AuthService();

  final _formKey = GlobalKey<FormState>();
  final _password1 = TextEditingController();


  @override
  void dispose() {
    super.dispose();
    _password1.dispose();
  }

  Future<bool> _login(String email) async{
    try{
      final user = await _auth.loginUserWithEmailAndPassword(email, _password1.text);
      if(user != null){
        log("User logged in successfully!");
        return true;
      }
      return false;
    }catch(e){
      log("Login error: $e");
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {

    final Map<String, String>? args =
    ModalRoute.of(context)?.settings.arguments as Map<String, String>?;

    final String email = args?['email'] ?? '';

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color.fromRGBO(87, 144, 8, 1),
        child: Center(
          child: Form(
            key: _formKey,
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
                          'Step 2',
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "What is your user password",
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
                          controller: _password1,
                          obscureText: true,
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 20),

                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 75),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context); 
                        },
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
                          'Back',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            height: 19.36 / 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final isLoginSuccessful = await _login(email);

                            if (isLoginSuccessful) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LoggingInAccount()),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Incorrect password. Please try again."),
                                ),
                              );
                            }
                          }
                        },
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
                          'Finish',
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
      ),
    );
  }
}
