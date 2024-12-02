import 'package:flutter/material.dart';

class GeneralTextButton extends StatelessWidget {
  final String label;
  final Color color;
  final Color backgroundColor;
  final VoidCallback onPressed;
  final double padding;

  const GeneralTextButton({
    super.key,
    required this.label,
    required this.color,
    required this.backgroundColor,
    required this.onPressed,
    this.padding = 20
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: this.onPressed,
        style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: this.padding),
            backgroundColor: Color(0xFFF1F1F1),
            minimumSize: Size(0, 40)
        ),
        child: Text('${this.label}', style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontFamily: 'Inter',
            color: this.color
        ))
    );
  }
}