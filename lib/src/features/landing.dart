import 'package:cc206_benta/src/features/log-in/login-1.dart';
import 'package:flutter/material.dart';

import 'package:cc206_benta/src/features/sign-up/sign-up-1.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
          Container(
              height: MediaQuery.sizeOf(context).height,
              color: Color.fromRGBO(87, 144, 8, 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      child: Image.asset(
                          'assets/images/benta_logo_full_tagline_1280_x_720.png')),
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                      child: Column(
                        children: [
                          Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: Text('New to Benta?',
                                  style: CustomTextStyle.TextBoldWhite)),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SignUp1()),
                                );
                              },
                              child: Text('Sign-up',
                                  style: CustomTextStyle.TextBoldBlack),
                              style: TextButton.styleFrom(
                                  fixedSize: Size(215, 45),
                                  backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                                  foregroundColor: Color.fromRGBO(31, 31, 31, 1)))
                        ],
                      )),
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
                      child: Column(
                        children: [
                          Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: Text('Have an account?',
                                  style: CustomTextStyle.TextBoldWhite)),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => LogIn1()),
                                );
                              },
                              child: Text('Log-in',
                                  style: CustomTextStyle.TextBoldBlack),
                              style: TextButton.styleFrom(
                                  fixedSize: Size(215, 45),
                                  backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                                  foregroundColor: Color.fromRGBO(31, 31, 31, 1)))
                        ],
                      ))
                ],
              ))
        ]));
  }
}

class CustomTextStyle {
  static const TextBoldWhite = TextStyle(
      color: Color.fromRGBO(255, 255, 255, 1),
      fontSize: 20,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700);
  static const TextBoldBlack = TextStyle(
      color: Color.fromRGBO(31, 31, 31, 1),
      fontSize: 20,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700);
}