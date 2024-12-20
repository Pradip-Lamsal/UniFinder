import 'package:flutter/material.dart';

class UniversitiesPage extends StatelessWidget {
  const UniversitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Hide the back button
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildCollegeCard(
              name: 'University of Texas',
              location: 'Richardson, Texas',
              fees: '\$50,706 | ₹42.85L',
              scores: 'GRE: 317',
              image:
                  'assets/images/texas.jpg', // Replace with a valid image path
            ),
            const SizedBox(height: 16),
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
    );
  }

  Widget _buildCollegeCard({
    required String name,
    required String location,
    required String fees,
    required String scores,
    required String image,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 150,
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
    );
  }
}
