import 'package:flutter/material.dart';

import 'profile_page.dart';
import 'universities_page.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  // Pages corresponding to each tab
  final List<Widget> _pages = [
    const HomePage(),
    const UniversitiesPage(), // Updated to use the new UniversitiesPage
    const ProfilePage(),
  ];

  // Update the selected index
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UniFinder Dashboard'),
        backgroundColor: Colors.blueAccent,
      ),
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Universities',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hello, Pradip Lamsal',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Explore universities based on your preferences.',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 16),

            // Scholarship Section
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildScholarshipCard(
                    title: '100% SEVIS fee scholarship for USA',
                    counselor: 'Ditipriya Ch.',
                    backgroundColor: Colors.orange[100]!,
                  ),
                  _buildScholarshipCard(
                    title: '50% visa scholarship for UK',
                    counselor: 'Rohit S.',
                    backgroundColor: Colors.blue[100]!,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Most Preferred Colleges Section
            const Text(
              'Most Preferred Colleges',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildCollegeCard(
                    name: 'University of Texas',
                    location: 'Richardson, Texas',
                    fees: '\$50,706 | ₹42.85L',
                    scores: 'GRE: 317',
                    image:
                        'assets/images/texas.jpg', // Replace with a valid image path
                  ),
                  _buildCollegeCard(
                    name: 'University of Southern California',
                    location: 'Los Angeles, California',
                    fees: '\$40,688 | ₹34.38L',
                    scores: 'GRE: 317.5, GMAT: 707',
                    image:
                        'assets/images/california.jpg', // Replace with a valid image path
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScholarshipCard({
    required String title,
    required String counselor,
    required Color backgroundColor,
  }) {
    return Container(
      width: 250,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Text('Counselor: $counselor'),
        ],
      ),
    );
  }

  Widget _buildCollegeCard({
    required String name,
    required String location,
    required String fees,
    required String scores,
    required String image,
  }) {
    return Container(
      width: 250,
      margin: const EdgeInsets.only(right: 16),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(location, style: TextStyle(color: Colors.grey[600])),
                  const SizedBox(height: 4),
                  Text(fees, style: TextStyle(color: Colors.green[600])),
                  const SizedBox(height: 4),
                  Text(scores, style: TextStyle(color: Colors.grey[600])),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
