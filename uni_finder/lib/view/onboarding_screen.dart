import 'package:flutter/material.dart';
import 'package:uni_finder/view/login_screen.dart';
import 'package:uni_finder/view/onboarding2_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  // Number of pages in the onboarding process
  final int _pageCount = 3;
  final int _currentPage = 0; // Current page index (0 for the first page)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Top Row: Logo and Skip
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Center Image
              Image.asset(
                'assets/images/onboard_image1.jpg', // Replace with your image path
                height: 200,
              ),

              const SizedBox(height: 30),

              // Title and Subtitle
              const Column(
                children: [
                  Text(
                    'Find Your Perfect University',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 102, 141, 209),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Discover universities that match your preferences.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Dynamic Pagination Indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_pageCount, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: CircleAvatar(
                      radius: 4,
                      backgroundColor: _currentPage == index
                          ? Colors.blueAccent
                          : Colors.grey,
                    ),
                  );
                }),
              ),

              const SizedBox(height: 20),

              // Next Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OnboardingScreen2()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10), // Safe space at bottom
            ],
          ),
        ),
      ),
    );
  }
}
