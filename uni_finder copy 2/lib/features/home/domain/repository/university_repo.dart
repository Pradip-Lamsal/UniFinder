// ../entity/consultancy.dart
class Consultancy {
  final String universityName;
  final String location;
  final String? description;

  Consultancy({
    required this.universityName,
    required this.location,
    this.description,
  });

  // For simplicity, assuming it can be represented as a Map for the UI
  Map<String, dynamic> toMap() {
    return {
      'name': universityName,
      'location': location,
      'contact': description,
    };
  }
}
