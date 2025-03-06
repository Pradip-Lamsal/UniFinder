import 'package:equatable/equatable.dart';

class Course extends Equatable {
  final String id;
  final String courseType;
  final String courseCategory;
  final String courseDuration;
  final String? instructor;

  const Course({
    required this.id,
    required this.courseType,
    required this.courseCategory,
    required this.courseDuration,
    this.instructor,
  });

  @override
  List<Object?> get props =>
      [id, courseType, courseCategory, courseDuration, instructor];
}
