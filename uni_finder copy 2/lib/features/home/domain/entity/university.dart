import 'package:equatable/equatable.dart';

import '../../../auth/domain/entity/course.dart';

class University extends Equatable {
  final String id;
  final String name;
  final List<Course> courses;

  const University({
    required this.id,
    required this.name,
    required this.courses,
  });

  @override
  List<Object?> get props => [id, name, courses];
}
