import 'package:cc206_benta/src/shared-components/custom-widgets/general-bottom-nav-bar.dart';
import 'package:cc206_benta/src/shared-components/custom-widgets/general-top-nav-label.dart';
import 'package:cc206_benta/src/shared-components/custom-widgets/pos-add-item-button.dart';
import 'package:flutter/material.dart';

class AddItems extends StatefulWidget {
  @override
  _AddItemsState createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {

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
                        Text('Press an item to add to the transaction:',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                            )
                        ),
                        SizedBox(height: 20),
                        Flex(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          direction: Axis.vertical,
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    PosAddItemButton(itemImg: 'image1.png', price: 0, onPressed: (){}),
                                    PosAddItemButton(itemImg: 'image2.png', price: 0, onPressed: (){})
                                  ]
                              ),
                              SizedBox(height: 20),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    PosAddItemButton(itemImg: 'image3.png', price: 0, onPressed: (){}),
                                    PosAddItemButton(itemImg: 'image4.png', price: 0, onPressed: (){})
                                  ]
                              ),
                              SizedBox(height: 20),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    PosAddItemButton(itemImg: 'image5.png', price: 0, onPressed: (){}),
                                    PosAddItemButton(itemImg: 'image6.png', price: 0, onPressed: (){})
                                  ]
                              ),
                            ]
                        )
                      ]
                  )
              )
          ),
          GeneralBottomNavBar(
              navItems: 2,
              navLabels: ['Back', 'Save'],
              navActions: [
                () => Navigator.pushNamed(context, '/dashboard/point-of-sale'),
                (){}
              ]
          )
        ]
      )
    );
  }
}
