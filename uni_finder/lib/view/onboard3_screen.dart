import 'package:flutter/material.dart';
import 'package:uni_finder/view/login_screen.dart';

class OnboardingScreen3 extends StatelessWidget {
  const OnboardingScreen3({super.key});

  // Total number of pages in the onboarding process
  final int _pageCount = 3;

  // Current page index passed dynamically (can be updated from the previous screen)
  final int _currentPage = 3; // Assuming this is the 3rd page

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
              // Top Row: Back Button and Skip Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back Button
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.grey),
                    onPressed: () {
                      Navigator.pop(
                          context); // Navigate back to the previous screen
                    },
                  ),
                  // Skip Button
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
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
                'assets/images/onboard_image5.png', // Replace with your third image
                height: 200,
              ),

              const SizedBox(height: 30),

              // Title and Subtitle
              const Column(
                children: [
                  Text(
                    'Virtual Tour',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 102, 141, 209),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Explore campuses from the comfort of your home.',
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
                      backgroundColor: _currentPage == (index + 1)
                          ? const Color.fromARGB(255, 80, 181, 248)
                          : Colors.grey,
                    ),
                  );
                }),
              ),

              const SizedBox(height: 20),

              // Get Started Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
