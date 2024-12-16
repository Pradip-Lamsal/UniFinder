import 'package:flutter/material.dart';
import 'package:uni_finder/view/dashboard.dart';
import 'package:uni_finder/view/login_screen.dart';
import 'package:uni_finder/view/onboarding_screen.dart';
import 'package:uni_finder/view/signup_screen.dart';
import 'package:uni_finder/view/splash_screen.dart';

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
