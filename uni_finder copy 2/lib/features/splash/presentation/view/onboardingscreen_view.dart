import 'package:bus_application/app/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/presentation/view/login_view.dart';
import '../../../auth/presentation/view_model/login/login_bloc.dart';

// Constants for consistent styling
const _primaryColor = Color(0xFF1A237E); // Deep indigo for buttons and accents
const _secondaryColor = Color(0xFF3F51B5); // Lighter indigo for gradients
const _textColor = Colors.black87;
const _descriptionColor = Colors.grey;
const _buttonTextColor = Colors.white;
const _buttonPadding = EdgeInsets.symmetric(vertical: 16);
const _pagePadding = EdgeInsets.symmetric(horizontal: 24.0);
const _cardElevation = 4.0;
var _borderRadius = BorderRadius.circular(12.0);

class OnboardingScreenView extends StatefulWidget {
  const OnboardingScreenView({super.key});

  @override
  State<OnboardingScreenView> createState() => _OnboardingScreenViewState();
}

class _OnboardingScreenViewState extends State<OnboardingScreenView> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  // List of onboarding pages
  final List<Map<String, String>> _pages = [
    {
      'image': 'assets/images/logo.png',
      'title': 'Welcome to UniFinder',
      'description': 'Find your perfect university with ease and confidence.',
    },
    {
      'image': 'assets/images/onboard_image1.jpg',
      'title': 'Explore Anywhere',
      'description': 'Discover universities anytime, anywhere without limits.',
    },
    {
      'image': 'assets/images/onboard_image2.png',
      'title': 'Get Started Now!',
      'description': 'Start your journey to find the best university for you.',
    },
  ];

  // Skip to the last page
  void _skipToLastPage() {
    _pageController.jumpToPage(_pages.length - 1);
  }

  // Navigate to the login screen
  void _navigateToLogin() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BlocProvider.value(
          value: getIt<LoginBloc>(),
          child: const LoginView(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: _buildBody(),
      bottomSheet: _currentPage == _pages.length - 1
          ? _buildGetStartedButton()
          : _buildBottomNavButtons(),
    );
  }

  // AppBar with Skip button
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      actions: [
        if (_currentPage != _pages.length - 1)
          TextButton(
            onPressed: _skipToLastPage,
            child: const Text(
              "Skip",
              style: TextStyle(
                color: _textColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }

  // Main body with PageView and gradient background
  Widget _buildBody() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white,
            _secondaryColor,
          ],
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: _pages.length,
              itemBuilder: (context, index) {
                return _buildPage(
                  image: _pages[index]['image']!,
                  title: _pages[index]['title']!,
                  description: _pages[index]['description']!,
                );
              },
            ),
          ),
          _buildPageIndicator(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // Individual onboarding page
  Widget _buildPage({
    required String image,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: _pagePadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            elevation: _cardElevation,
            shape: RoundedRectangleBorder(borderRadius: _borderRadius),
            child: ClipRRect(
              borderRadius: _borderRadius,
              child: Image.asset(
                image,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: _textColor,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: _descriptionColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  // Page indicator dots
  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _pages.length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 8,
          width: _currentPage == index ? 24 : 8,
          decoration: BoxDecoration(
            color: _currentPage == index ? _primaryColor : Colors.grey[300],
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }

  // Bottom navigation buttons (Back and Next)
  Widget _buildBottomNavButtons() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Back Button: Hidden on the first screen
          _currentPage > 0
              ? _buildButton(
                  text: "Back",
                  color: Colors.grey.shade300,
                  textColor: _textColor,
                  onPressed: () => _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  ),
                )
              : const SizedBox(), // Empty space to align Next button

          // Next Button
          _buildButton(
            text: "Next",
            color: _primaryColor,
            textColor: _buttonTextColor,
            onPressed: () => _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            ),
          ),
        ],
      ),
    );
  }

  // Get Started button on the last page
  Widget _buildGetStartedButton() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: _buildButton(
              text: "Get Started",
              color: _primaryColor,
              textColor: _buttonTextColor,
              padding: _buttonPadding,
              onPressed: _navigateToLogin,
            ),
          ),
        ],
      ),
    );
  }

  // Reusable button widget with modern styling
  Widget _buildButton({
    required String text,
    required Color color,
    required Color textColor,
    EdgeInsets padding =
        const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
    required VoidCallback onPressed,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: textColor,
          padding: padding,
          shape: RoundedRectangleBorder(borderRadius: _borderRadius),
          elevation: 5,
          shadowColor: Colors.black.withOpacity(0.3),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
