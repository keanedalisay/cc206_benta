import 'package:flutter/material.dart';

class PosAddItemButton extends StatelessWidget {
  final String itemImg;
  final double price;
  final GestureTapCallback onPressed;

  const PosAddItemButton({
    super.key,
    required this.itemImg,
    required this.price,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: this.onPressed,
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            width: 100,
            height: 115,
            decoration: BoxDecoration(
              color: Color(0xFFF1F1F1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Image.asset('assets/images/${this.itemImg}', width: 70, height: 70, fit: BoxFit.cover),
                SizedBox(height: 5),
                Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Color(0xFF787878),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    alignment: Alignment.center,
                    child: Text('${this.price}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700))
                ),
              ],
            )
        ),
    );
  }
}