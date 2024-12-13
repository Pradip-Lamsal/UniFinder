import 'package:flutter/material.dart';

void main() {
  runApp(const UniFinderApp());
}

class UniFinderApp extends StatelessWidget {
  const UniFinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UniFinder Dashboard'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greeting Section
              const Text(
                'Hello, Suman Khadka',
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
                          'assets/texas.jpg', // Replace with a valid image path
                    ),
                    _buildCollegeCard(
                      name: 'University of Southern California',
                      location: 'Los Angeles, California',
                      fees: '\$40,688 | ₹34.38L',
                      scores: 'GRE: 317.5, GMAT: 707',
                      image:
                          'assets/usc.jpg', // Replace with a valid image path
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Partner Universities Section
              Text(
                'Partner Universities in USA',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Container(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildCollegeCard(
                      name: 'Arizona State University',
                      location: 'Tempe, Arizona',
                      fees: '\$30,000 | ₹26.50L',
                      scores: 'GRE: 300',
                      image:
                          'assets/asu.jpg', // Replace with a valid image path
                    ),
                    _buildCollegeCard(
                      name: 'New Jersey Institute of Technology',
                      location: 'Newark, New Jersey',
                      fees: '\$35,000 | ₹31.00L',
                      scores: 'GRE: 310',
                      image:
                          'assets/njit.jpg', // Replace with a valid image path
                    ),
                  ],
                ),
              ),
            ],
          ),
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
      margin: EdgeInsets.only(right: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Spacer(),
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
      margin: EdgeInsets.only(right: 16),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
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
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(location, style: TextStyle(color: Colors.grey[600])),
                  SizedBox(height: 4),
                  Text(fees, style: TextStyle(color: Colors.green[600])),
                  SizedBox(height: 4),
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
