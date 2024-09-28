import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        Column(
          children: [
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(20),
                color: Color.fromRGBO(25, 170, 255, .8),
                child: Text('Benta your way to Business',
                    style: CustomTextStyle.H1)
            ),
            Container(
                child: Image.asset('assets/images/business_as.jpg',
                    fit: BoxFit.cover)
            ),
            Container(
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Text('Want to contact us? Call at 0999-999-9999!',
                style: CustomTextStyle.Small
                )
            )
          ],
        )
    );
  }
}

class CustomTextStyle {
  static const H1 = TextStyle(
      fontSize: 30,
      fontFamily: 'Arial',
      fontWeight: FontWeight.w600
  );

  static const Small = TextStyle(
      fontSize: 14,
      fontFamily: 'Arial'
  );
}