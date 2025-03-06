import 'package:equatable/equatable.dart';

class Course extends Equatable {
  final String id;
  final String courseType;
  final String courseCategory;
  final String courseDuration;
  final String timePeriod;

  const Course(
      {required this.id,
      required this.courseType,
      required this.courseCategory,
      required this.courseDuration,
      required this.timePeriod});

  @override
  List<Object?> get props =>
      [id, courseType, courseCategory, courseDuration, timePeriod];
}
