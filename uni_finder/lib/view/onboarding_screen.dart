import 'package:flutter/material.dart';

import 'login_screen.dart'; // Import the Login Screen

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image":
          "assets/images/onboard_image1.jpg", // Replace with your image paths
      "title": "Welcome to UniFinder",
      "subtitle": "Find the best universities for your future!"
    },
    {
      "image": "assets/images/onboard_image5.jpg",
      "title": "Explore Opportunities",
      "subtitle": "Discover a world of opportunities waiting for you."
    },
    {
      "image": "assets/images/onboarding3.png",
      "title": "Achieve Success",
      "subtitle": "Get closer to your dreams with UniFinder."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: onboardingData.length,
              itemBuilder: (context, index) => OnboardingContent(
                image: onboardingData[index]["image"]!,
                title: onboardingData[index]["title"]!,
                subtitle: onboardingData[index]["subtitle"]!,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              onboardingData.length,
              (index) => DotIndicator(isActive: index == _currentPage),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ElevatedButton(
              onPressed: () {
                if (_currentPage == onboardingData.length - 1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                  );
                } else {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: Text(
                _currentPage == onboardingData.length - 1
                    ? "Get Started"
                    : "Next",
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class OnboardingContent extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const OnboardingContent({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image, height: 200), // Display image
        const SizedBox(height: 20),
        Text(
          title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Text(
          subtitle,
          style: const TextStyle(fontSize: 16, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class DotIndicator extends StatelessWidget {
  final bool isActive;

  const DotIndicator({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: isActive ? 12 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.blueAccent : Colors.grey,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
