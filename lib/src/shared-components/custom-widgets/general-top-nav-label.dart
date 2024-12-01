import 'package:flutter/material.dart';

class GeneralTopNavLabel extends StatelessWidget {
  final String label;
  final String iconName;

  const GeneralTopNavLabel({
    super.key,
    required this.label,
    required this.iconName
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 5, right: 20, left: 20),
        height: 75,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/icons/${this.iconName}', width: 30, height: 30),
            SizedBox(width: 20),
            Text('${this.label}', style: TextStyle(
              color: Color(0xFF787878),
                fontWeight: FontWeight.w700,
              fontSize: 16
            ),)
          ],
        ),
      );
  }
}