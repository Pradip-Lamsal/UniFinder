// ../entity/consultancy.dart
class Consultancy {
  final String name;
  final String location;
  final String? contact;

  Consultancy({
    required this.name,
    required this.location,
    this.contact,
  });

  // For simplicity, assuming it can be represented as a Map for the UI
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'location': location,
      'contact': contact,
    };
  }
}
