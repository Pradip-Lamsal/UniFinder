import 'package:hive/hive.dart';

import '../../../auth/domain/entity/course.dart';

part 'course_model.g.dart';

@HiveType(typeId: 1)
class CourseModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String courseType;

  @HiveField(2)
  final String courseCategory;
  @HiveField(3)
  final String courseDuration;

  CourseModel(
      {required this.id,
      required this.courseType,
      required this.courseCategory,
      required this.courseDuration});

  factory CourseModel.fromEntity(Course course) {
    return CourseModel(
      id: course.id,
      courseType: course.courseType,
      courseCategory: course.courseCategory,
      courseDuration: course.courseDuration,
    );
  }

  // Implement fromJson to deserialize JSON data into CourseModel
  static CourseModel fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'] as String,
      courseType: json['courseType'] as String,
      courseCategory: json['courseCategory'] as String,
      courseDuration: json['courseDuration'] as String,
    );
  }

  Course toEntity() {
    return Course(
      id: id,
      courseType: courseType,
      courseCategory: courseCategory,
      courseDuration: courseDuration,
    );
  }
}
