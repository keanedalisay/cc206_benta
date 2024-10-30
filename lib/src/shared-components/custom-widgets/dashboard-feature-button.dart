import 'package:flutter/material.dart';

class DashboardFeatureButton extends StatelessWidget {
  final String featureName;
  final String iconName;
  final MaterialPageRoute route;

  const DashboardFeatureButton(
      {
        super.key,
        required this.featureName,
        required this.iconName,
        required this.route
      });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 0)
        ),
        onPressed: () {
          Navigator.push(context, route);
        },
        child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'icons/${this.iconName}',
                  width: 40,
                  height: 40,
                ),
                const SizedBox(height: 10),
                Text(
                  this.featureName,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    height: 14.52 / 12,
                    color: Color(0xFF579008),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
        )
    );
  }
}
