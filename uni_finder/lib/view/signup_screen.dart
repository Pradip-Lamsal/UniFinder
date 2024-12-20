import 'package:flutter/material.dart';

import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo
            Image.asset(
              'assets/images/logo.png', // Replace with your logo path
              height: 100,
            ),
            const SizedBox(height: 20),
            // App Name
            const Text(
              'Unifinder',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 20),
            // Title
            const Text(
              'Create an Account',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            // Subtitle
            const Text(
              'Please fill this details to create an account',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 30),
            // Username Field
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person, color: Colors.blueAccent),
                hintText: 'Enter Username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.blueAccent),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Email Field
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.email, color: Colors.blueAccent),
                hintText: 'Enter Gmail',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.blueAccent),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Password Field
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock, color: Colors.blueAccent),
                hintText: 'Enter Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.blueAccent),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Sign-Up Button
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
              ),
              child: const Text(
                'Sign Up',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            // Login Text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account? ",
                  style: TextStyle(color: Colors.grey),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to LoginScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Log In',
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
