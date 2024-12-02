import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cc206_benta/src/shared-components/custom-widgets/general-bottom-nav-bar.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {

    User? user = FirebaseAuth.instance.currentUser;

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

            Text(
              'Email',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600]
              ),
            ),

            const SizedBox(height: 10),

            Row(
                children: [
                  Icon(
                    Icons.edit,
                    size: 20,
                    color: Colors.green[400],
                  ),

                  const SizedBox(width: 8),

                  user != null
                      ? Text(
                    user.email ?? 'No email available',
                    style: TextStyle(fontSize: 16),
                  )
                      : Text('No user logged in'),
                ]
            ),

            const SizedBox(height: 25),

            Text(
              'Password',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600]
              ),
            ),

            const SizedBox(height: 10),

            Row(
                children: [
                  Icon(
                    Icons.edit,
                    size: 20,
                    color: Colors.green[400],
                  ),

                  const SizedBox(width: 8),

                  Text(
                    '**********',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600]
                    ),
                  )
                ]
            ),

            const SizedBox(height: 25),

            Text(
              'User Role',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600]
              ),
            ),

            const SizedBox(height: 10),

            Row(
                children: [
                  Icon(
                    Icons.edit,
                    size: 20,
                    color: Colors.green[400],
                  ),

                  const SizedBox(width: 8),

                  Text(
                    'Admin',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600]
                    ),
                  ),
                ]
            ),

            const SizedBox(height: 45),

            const Text(
              'Business',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            Text(
              'Business Account ID',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600]
              ),
            ),

            const SizedBox(height: 10),

            Row(
                children: [
                  Icon(
                    Icons.perm_identity,
                    size: 20,
                    color: Colors.green[400],
                  ),

                  const SizedBox(width: 8),

                  Text(
                    'ILM-0A1F-9231',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600]
                    ),
                  ),
                ]
            ),

            const SizedBox(height: 25),

            Text(
              'Business Name',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600]
              ),
            ),

            const SizedBox(height: 10),

            Row(
                children: [
                  Icon(
                    Icons.perm_identity,
                    size: 20,
                    color: Colors.green[400],
                  ),

                  const SizedBox(width: 8),

                  Text(
                    'I Love Milktea',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600]
                    ),
                  ),
                ]
            ),
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