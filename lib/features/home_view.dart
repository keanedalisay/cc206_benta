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
                padding: EdgeInsets.all(20),
                color: Color.fromRGBO(25, 170, 255, .8),
                child: Text('Benta your way to Business',
                    style: CustomTextStyle.H1)
            ),
            Container(
                child: Image.network('https://blog.epson.com.ph/wp-content/uploads/2020/07/SMEs_2-1024x576.jpg',
                    fit: BoxFit.cover)
            ),
            Container(
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