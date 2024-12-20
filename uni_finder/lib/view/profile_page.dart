import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Hide the back button
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[300],
                child: const Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // User Name
            const Center(
              child: Text(
                'Pradip Lamsal',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Additional Info
            Center(
              child: Text(
                'User of UniFinder App',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Settings Options
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.blueAccent),
              title: const Text('Settings'),
              onTap: () {
                // Navigate to Settings screen or handle action
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.redAccent),
              title: const Text('Logout'),
              onTap: () {
                // Handle Logout action
              },
            ),
          ],
        ),
      ),
    );
  }
}
