import 'package:flutter/material.dart';

class PosTransactionItemButton extends StatelessWidget {
  final String itemName;
  final String itemImg;
  final double price;
  final GestureTapCallback onPressed;

  const PosTransactionItemButton({
    super.key,
    required this.itemName,
    required this.itemImg,
    required this.price,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: this.onPressed,
        child: Container(
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: Color(0xFFF1F1F1),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(children: [
              Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Color(0xFF787878),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  alignment: Alignment.center,
                  child: Text('10', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700))
              ),
              SizedBox(width: 5),
              Image.asset('assets/images/${this.itemImg}', width: 40, height: 40),
              SizedBox(width: 5),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${this.itemName}', style: TextStyle(fontSize: 12)),
                    Text('₱ ${this.price}.00', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xFF579008))),
                  ]),

            ])
        )
    );
  }
}