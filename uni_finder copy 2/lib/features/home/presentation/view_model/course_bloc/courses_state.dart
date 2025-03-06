import 'package:equatable/equatable.dart';

import '../../../../auth/domain/entity/course.dart';

abstract class CoursesState extends Equatable {
  const CoursesState();

  @override
  List<Object> get props => [];
}

class CoursesLoading extends CoursesState {}

class CoursesLoaded extends CoursesState {
  final List<Course> courses;
  final Course? selectedCourse;

  const CoursesLoaded(this.courses, {this.selectedCourse});

  @override
  List<Object> get props => [courses, selectedCourse ?? {}];
}

class CoursesError extends CoursesState {
  final String message;

  const CoursesError(this.message);

  @override
  List<Object> get props => [message];
}
