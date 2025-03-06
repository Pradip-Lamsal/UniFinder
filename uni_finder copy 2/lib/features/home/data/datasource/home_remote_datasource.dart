import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../app/constants/api_endpoints.dart';

class HomeRemoteDataSource {
  Future<List<dynamic>> fetchUniversities() async {
    final url =
        Uri.parse('${ApiEndpoints.baseUrl}${ApiEndpoints.universities}');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Decode JSON response properly
        List<dynamic> universities = jsonDecode(response.body);
        return universities;
      } else {
        throw Exception("Failed to load universities: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching universities: $e");
    }
  }

  Future<List<dynamic>> fetchCourse() async {
    final url = Uri.parse('${ApiEndpoints.baseUrl}${ApiEndpoints.course}');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Decode JSON response properly
        List<dynamic> course = jsonDecode(response.body);
        return course;
      } else {
        throw Exception("Failed to load courses: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching courses: $e");
    }
  }

  Future<List<dynamic>> fetchConsultancies() async {
    final url =
        Uri.parse('${ApiEndpoints.baseUrl}${ApiEndpoints.consultancies}');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Decode JSON response properly
        List<dynamic> course = jsonDecode(response.body);
        return course;
      } else {
        throw Exception("Failed to load consultancies: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching consultancies: $e");
    }
  }
}
