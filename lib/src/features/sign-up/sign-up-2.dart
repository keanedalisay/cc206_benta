import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:cc206_benta/src/features/sign-up/auth_service.dart';
import 'package:cc206_benta/src/features/sign-up/sign-up-1.dart';
import 'package:cc206_benta/src/features/sign-up/creating-account.dart';

import '../../shared-components/custom-widgets/general-text-button.dart';


class SignUp2 extends StatefulWidget{

  const SignUp2({ Key? key }) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}


class _SignUpState extends State<SignUp2> {

  @override
  void dispose(){
    super.dispose();
    _passwordController.dispose();
  }

  final _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();


  bool _isVisible = false;
  bool _isVisible2 = false;

  String? _password;

  _signup(String email) async{
    final user = await _auth.createUserWithEmailAndPassword(email, _passwordController.text);
    if(user != null){
      log("User Created Successfully");
    }
  }

  @override
  Widget build(BuildContext context) {

    final Map<String, String>? args =
    ModalRoute.of(context)?.settings.arguments as Map<String, String>?;

    final String email = args?['email'] ?? '';

    return Scaffold(
      backgroundColor: const Color(0xFF579008),
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
                        'Step 2',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
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
                        'What will be your password?',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // TextFormField for Password
                      SizedBox(
                          width: 350,
                          height: 54,
                          child: TextFormField(
                              obscureText: !_isVisible,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: (){
                                    setState(() {
                                      _isVisible = !_isVisible;
                                    });
                                  },
                                  icon: _isVisible
                                      ? const Icon(Icons.visibility)
                                      : const Icon(Icons.visibility_off),
                                ),
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
                              onChanged: (value){
                                _password = value;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty){
                                  return 'Please enter a password';
                                } else if (value.length < 6){
                                  return 'Password must be at least 6 characters long';
                                }
                                return null;
                              }
                          )
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        'Confirm your user password',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // TextFormField for Password Confirmation
                      SizedBox(
                          width: 350,
                          height: 54,
                          child: TextFormField(
                              controller: _passwordController,
                              obscureText: !_isVisible2,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: (){
                                    setState(() {
                                      _isVisible2 = !_isVisible2;
                                    });
                                  },
                                  icon: _isVisible2 ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                                ),
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
                                if (value == null || value.isEmpty){
                                  return 'Please confirm your password';
                                } else if (value !=  _password){
                                  return 'Passwords do not match';
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GeneralTextButton(
                          label: 'Cancel',
                          color: Color(0xFFFFFFFF),
                          backgroundColor: Color(0xFF579008),
                          onPressed: () => Navigator.pop(context)
                      ),
                      GeneralTextButton(
                          label: 'Sign-up',
                          color: Color(0xFF212121),
                          backgroundColor: Color(0xFFFFFFFF),
                          onPressed: () {
                            if (_formKey.currentState!.validate()){
                              _signup(email);
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => (CreatingAccount())),
                              );
                            }
                          }
                      )
                    ],
                  ),
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
