import 'package:hive/hive.dart';

import '../../domain/entity/university.dart';
import 'course_model.dart';

part 'university_model.g.dart';

@HiveType(typeId: 0)
class UniversityModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final List<CourseModel> courses;

  UniversityModel({
    required this.id,
    required this.name,
    required this.courses,
  });

  factory UniversityModel.fromEntity(University university) {
    return UniversityModel(
      id: university.id,
      name: university.name,
      courses: university.courses
          .map((course) => CourseModel.fromEntity(course))
          .toList(),
    );
  }

  University toEntity() {
    return University(
      id: id,
      name: name,
      courses: courses.map((course) => course.toEntity()).toList(),
    );
  }
}
