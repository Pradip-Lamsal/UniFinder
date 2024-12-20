import 'package:bus_application/view/dashboard.dart';
import 'package:bus_application/view/login_screen.dart';
import 'package:bus_application/view/onboarding_screen.dart';
import 'package:bus_application/view/signup_screen.dart';
import 'package:bus_application/view/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/onboarding': (context) => const OnboardingScreen(),
      },
    );
  }
}
