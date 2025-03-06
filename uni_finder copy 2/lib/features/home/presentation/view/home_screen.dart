import 'package:flutter/material.dart';

import 'button view/consultancies.dart';
import 'button view/course.dart';
import 'button view/home.dart';
import 'button view/settings.dart';
import 'button view/universities.dart';

class HomeScreen extends StatefulWidget {
  final void Function(bool) toggleTheme;
  const HomeScreen({super.key, required this.toggleTheme});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  late final List<Widget> _views;

  @override
  void initState() {
    super.initState();
    _views = [
      const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to UniFinder!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Discover your perfect university',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
      const UniversitiesView(),
      const ConsultanciesView(),
      const CoursesView(),
      SettingsView(onThemeChanged: widget.toggleTheme),
      HomeView(toggleTheme: widget.toggleTheme),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'UniFinder',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: _views[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.school), label: 'Universities'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Consultancy'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Courses'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
    );
  }
}
