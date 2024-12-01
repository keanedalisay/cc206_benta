import 'package:flutter/material.dart';

class GeneralBottomNavBar extends StatefulWidget {
  final int navItems;
  final List<String> navLabels;
  final List<GestureTapCallback> navActions;

  @override
  _GeneralBottomNavBarState createState() => _GeneralBottomNavBarState();

  const GeneralBottomNavBar({
    super.key,
    required this.navItems,
    required this.navLabels,
    required this.navActions
  });
}

class _GeneralBottomNavBarState extends State<GeneralBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.only(top: 5),
        height: 75,
        decoration: BoxDecoration(
          color: Color(0xFF579008),
          borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (var i = 0; i < widget.navItems; i++)
              GestureDetector(
                onTap: widget.navActions[i],
                child: Text(
                  widget.navLabels[i],
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Inter',
                    color: Colors.white,
                    fontWeight: FontWeight.w700
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
