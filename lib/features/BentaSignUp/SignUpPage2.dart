import 'package:flutter/material.dart';
import 'package:cc206_benta/features/BentaSignUp/SignUpPage1.dart';
import 'package:cc206_benta/features/BentaSignUp/CreatingAccountPage.dart';


class SignUpPage2 extends StatefulWidget{
  const SignUpPage2({ Key? key }) : super(key: key);

  @override
  _SignUpStep2 createState() => _SignUpStep2();
}


class _SignUpStep2 extends State<SignUpPage2> {

  bool _isVisible = false;
  bool _isVisible2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF579008),
      body: Padding(
        padding: const EdgeInsets.all(45.0),
        child:
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Center(
                child: Container(
                  width: 100,
                  height: 100,
                  child: Image.asset(
                    'assets/images/benta_logo.png',
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
                    icon: _isVisible ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
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
                          MaterialPageRoute(builder: (context) => SignUpPage()),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage3()),
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
    );
  }
}
