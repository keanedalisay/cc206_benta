import 'package:flutter/material.dart';

class DashboardBottomNavBar extends StatefulWidget {
  @override
  _DashboardBottomNavBarState createState() => _DashboardBottomNavBarState();

  const DashboardBottomNavBar({
    super.key,
  });
}

class _DashboardBottomNavBarState extends State<DashboardBottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      switch (_selectedIndex) {
        case 0:
          Navigator.pushNamed(context, '/dashboard');
        case 1:
          Navigator.pushNamed(context, '/dashboard/inventory');
        case 2:
          Navigator.pushNamed(context, '/dashboard/sales');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
        child: BottomNavigationBar(
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w700),
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.w700),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 8, bottom: 4),
                child: Image.asset(
                  'assets/icons/house.png',
                  width: 25,
                  height: 25,
                ),
              ),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 8, bottom: 2),
                child: Image.asset(
                  'assets/icons/boxes.png',
                  width: 25,
                  height: 25,
                ),
              ),
              label: 'Inventory',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 8, bottom: 2),
                child: Image.asset(
                  'assets/icons/stack-of-coins.png',
                  width: 25,
                  height: 25,
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
          selectedFontSize: 12,
          unselectedFontSize: 12,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
