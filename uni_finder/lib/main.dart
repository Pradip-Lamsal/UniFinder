import 'package:bus_application/view/splash_screen.dart';
import 'package:flutter/material.dart';
// Import the Onboarding Screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), // Starting with the Onboarding Screen
    );
  }
}
