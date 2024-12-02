import 'dart:developer';

import 'package:cc206_benta/src/shared-components/custom-widgets/general-text-button.dart';
import 'package:flutter/material.dart';
import 'package:cc206_benta/src/features/sign-up/auth_service.dart';
import 'package:cc206_benta/src/features/log-in/logging-in-account.dart';

class LogIn2 extends StatefulWidget {
  const LogIn2({super.key});

  @override
 _LogIn2State createState() => _LogIn2State();
}

class _LogIn2State extends State<LogIn2> {

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
    ModalRoute
        .of(context)
        ?.settings
        .arguments as Map<String, String>?;

    final String email = args?['email'] ?? '';

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: const Color.fromRGBO(87, 144, 8, 1),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Image.asset(
                  'assets/images/benta_logo_single_letter_80_x_80.png',
                  width: 80,
                  height: 80,
                ),
                const SizedBox(height: 20),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Log-in',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          height: 48.41 / 40,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Step 2',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          height: 29.05 / 24,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "What is your user password?",
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
                    ],
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GeneralTextButton(
                          label: 'Back',
                          color: Color(0xFFFFFFFF),
                          backgroundColor: Color(0xFF579008),
                          onPressed: () => Navigator.pop(context),
                          padding: 20
                      ),
                      GeneralTextButton(
                          label: 'Log-in',
                          color: Color(0xFF212121),
                          backgroundColor: Color(0xFFFFFFFF),
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
                          padding: 30
                      )
                    ],
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
