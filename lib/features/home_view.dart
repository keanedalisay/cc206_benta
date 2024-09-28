import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            ListView(children: [
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
                      child: Column(
                        children: [
                          Text("What services do we offer?", style: CustomTextStyle.H2),
                          Text("This is my point 1.", style: CustomTextStyle.Body),
                          Text("This is my point 2.", style: CustomTextStyle.Body),
                          Text("This is my point 3.", style: CustomTextStyle.Body),
                          Text("This is my point 4.", style: CustomTextStyle.Body)
                        ],
                      )
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
            ])
    );
  }
}

class CustomTextStyle {
  static const H1 = TextStyle(
      fontSize: 30,
      fontFamily: 'Arial',
      fontWeight: FontWeight.w600
  );

  static const H2 = TextStyle(
      fontSize: 24,
      fontFamily: 'Arial',
      fontWeight: FontWeight.w600
  );

  static const Body = TextStyle(
      fontSize: 18,
      fontFamily: 'Arial'
  );

  static const Small = TextStyle(
      fontSize: 14,
      fontFamily: 'Arial'
  );
}