// ../entity/consultancy.dart
class Consultancy {
  final String courseName;
  final String courseType;
  final String? timePeriod;

  Consultancy({
    required this.courseName,
    required this.courseType,
    this.timePeriod,
  });

  // For simplicity, assuming it can be represented as a Map for the UI
  Map<String, dynamic> toMap() {
    return {
      'name': courseName,
      'location': courseType,
      'contact': timePeriod,
    };
  }
}
