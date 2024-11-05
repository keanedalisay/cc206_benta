import 'package:flutter/material.dart';

import 'package:cc206_benta/src/features/dashboard/point-of-sale/point-of-sale.dart';
import 'package:cc206_benta/src/shared-components/custom-widgets/dashboard-feature-button.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/inverse_benta_logo_single_letter_80_x_80.png',
                    width: 80,
                    height: 80,
                  ),
                ),
                const SizedBox(height: 20),
                // Unique for every "Customer ex, Karen Daliva"
                Container(
                  width: 150,
                  height: 20,
                  margin: EdgeInsets.only(top: 89, left: 31),
                  child: Opacity(
                    opacity: 0, // Hidden
                    child: Text(
                      'Karen Daliva',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Inter',
                        height: 29.05 / 24,
                        textBaseline: TextBaseline.alphabetic,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Text(
                  'I <3 Milktea',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFFBDBDBD),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter',
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    print("Settings button clicked");
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.settings,
                          color: Colors.grey[600],
                          size: 20,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'Settings',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                            fontFamily: 'Inter',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          DashboardFeatureButton(
              featureName: 'Point-of-sale',
              iconName: 'cash-register.png',
              route: MaterialPageRoute(builder: (context) => PointOfSale())
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 100,
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
          child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Image.asset(
                    'assets/icons/house.png',
                    width: 28,
                    height: 28,
                  ),
                ),
                label: 'Dashboard',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Image.asset(
                    'assets/icons/boxes.png',
                    width: 28,
                    height: 28,
                  ),
                ),
                label: 'Inventory',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Image.asset(
                    'assets/icons/stack-of-coins.png',
                    width: 28,
                    height: 28,
                  ),
                ),
                label: 'Sales',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white70,
            backgroundColor: Color(0xFF579008),
            onTap: _onItemTapped,
            iconSize: 28,
            selectedFontSize: 14,
            unselectedFontSize: 12,
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),
    );
  }
}

