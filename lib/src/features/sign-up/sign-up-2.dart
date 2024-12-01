import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:cc206_benta/src/features/sign-up/auth_service.dart';
import 'package:cc206_benta/src/features/sign-up/sign-up-1.dart';
import 'package:cc206_benta/src/features/sign-up/creating-account.dart';


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
            
                const SizedBox(height: 20),
            
                const Text(
                  'Sign-up',
                  style: TextStyle(
                    fontSize: 44,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
            
                const Text(
                  'Step 2',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),
            
                const SizedBox(height: 40),
            
                const Text(
                  'What will be your password?',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
            
                const SizedBox(height: 12),
            
                // TextFormField for Password
                TextFormField(
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
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
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
                ),
            
                const SizedBox(height: 40),
            
                const Text(
                  'Confirm Your User Password',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
            
                const SizedBox(height: 12),
                // TextFormField for Password Confirmation
                TextFormField(
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
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
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
                ),
            
                const SizedBox(height: 60),
            
                // Sign Up Button
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUp1()),
                          );
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
                          'Back',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
            
                      const SizedBox(height: 40),
            
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()){
                            _signup(email);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => (CreatingAccount())),
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
                          'Finish',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
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
