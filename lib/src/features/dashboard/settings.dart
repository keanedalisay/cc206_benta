import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cc206_benta/src/shared-components/custom-widgets/general-bottom-nav-bar.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(36.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.settings,
                  size: 40,
                  color: Colors.grey[600],
                ),

                const SizedBox(width: 8),

                Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Inter',
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 35),

            const Text(
              'User Account',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),


          ],
        ),

      ),
      bottomNavigationBar: GeneralBottomNavBar(
          navItems: 2,
          navLabels: ['Back', 'Save'],
          navActions: [
                () => Navigator.pushNamed(context, '/dashboard'),
                (){}
          ]
      ),
    );
  }
}