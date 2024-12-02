import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cc206_benta/src/shared-components/custom-widgets/general-bottom-nav-bar.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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