import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Hides the debug banner
      home: SplashScreen(), // Sets the SplashScreen as the first screen
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Adds the background image
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/image.png'), // Path to your image
            fit: BoxFit.cover, // Ensures the image covers the screen
          ),
        ),
        // Center content in the middle of the screen
        child: const Center(
          child: Text(
            'Welcome to UniFinder', // Display some welcome text
            style: TextStyle(
              fontSize: 24, // Makes the text size bigger
              fontWeight: FontWeight.bold, // Makes the text bold
              color: Colors.white, // Sets the text color to white
            ),
          ),
        ),
      ),
    );
  }
}
