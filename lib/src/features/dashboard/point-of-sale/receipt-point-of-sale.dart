import 'package:cc206_benta/src/shared-components/custom-widgets/general-bottom-nav-bar.dart';
import 'package:cc206_benta/src/shared-components/custom-widgets/general-top-nav-label.dart';
import 'package:cc206_benta/src/shared-components/custom-widgets/pos-add-item-button.dart';
import 'package:flutter/material.dart';

import '../../../shared-components/custom-widgets/general-text-button.dart';

class Receipt extends StatefulWidget {
  @override
  _ReceiptState createState() => _ReceiptState();
}

class _ReceiptState extends State<Receipt> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
              child: Container(
                width: double.infinity,
                  height: MediaQuery.sizeOf(context).height,
                  margin: EdgeInsets.only(top: 40, bottom: 90),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('The transaction receipt can be found below:',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                            )
                        ),
                        SizedBox(height: 20),
                        Flex(direction: Axis.horizontal,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GeneralTextButton(
                                  label: 'Print',
                                  color: Color(0xFF579008),
                                  backgroundColor: Color(0xFFF1F1F1),
                                  onPressed: () {}
                              ),
                              GeneralTextButton(
                                  label: 'Download',
                                  color: Color(0xFF579008),
                                  backgroundColor: Color(0xFFF1F1F1),
                                  onPressed: () {}
                              ),
                            ]),
                        SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          height: 0,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: Color(0xFFF1F1F1),
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ]
                  )
              )
          ),
          GeneralBottomNavBar(
              navItems: 1,
              navLabels: ['Create new transaction'],
              navActions: [
                () => Navigator.pushNamed(context, '/dashboard/point-of-sale')
              ]
          )
        ]
      )
    );
  }
}
