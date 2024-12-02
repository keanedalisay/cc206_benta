import 'package:flutter/material.dart';

import 'package:cc206_benta/src/features/dashboard/point-of-sale/point-of-sale.dart';
import 'package:cc206_benta/src/shared-components/custom-widgets/dashboard-feature-button.dart';
import 'package:cc206_benta/src/shared-components/custom-widgets/dashboard-bottom-nav-bar.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
                  width: double.infinity,
                  height: 40,
                  margin: EdgeInsets.only(top: 0, left: 0),
                  child: const Opacity(
                    opacity: 1, // Hidden
                    child: Text(
                      'Karen Daliva',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Inter',
                        textBaseline: TextBaseline.alphabetic,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                const Text(
                  'I Love Milktea',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF787878),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter',
                  ),
                ),
                const Text(
                  'ILM-0A1F-9231',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFFBDBDBD),
                    fontFamily: 'Inter',
                  ),
                ),
                const SizedBox(height: 10),

                ElevatedButton(
                  onPressed: () {
                    print("Settings button clicked");
                    Navigator.pushNamed(
                        context,
                        '/dashboard/settings');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                    backgroundColor: Colors.grey[200],
                    foregroundColor: Colors.grey[600], // Color for text/icon
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 0, // To remove elevation if desired
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.settings,
                        size: 20,
                      ),
                      SizedBox(width: 6),
                      Text(
                        'Settings',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ],
                  ),
                )


              ],
            ),
          ),
          Container(
              padding: const EdgeInsets.only(top: 20, right: 20, bottom: 40, left: 20),
              child: Column(children: [
                  DashboardFeatureButton(
                      featureName: 'Point-of-sale',
                      iconName: 'cash-register.png',
                      route: MaterialPageRoute(builder: (context) => PointOfSale())
                  )],
              )
          )
        ],
      )),
      bottomNavigationBar: DashboardBottomNavBar()
    );
  }
}

