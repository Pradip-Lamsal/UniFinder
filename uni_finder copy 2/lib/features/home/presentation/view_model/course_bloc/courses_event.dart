import 'package:equatable/equatable.dart';

abstract class CoursesEvent extends Equatable {
  const CoursesEvent();

  @override
  List<Object> get props => [];
}

class FetchCourses extends CoursesEvent {}

class SelectCourse extends CoursesEvent {
  final dynamic course;

  const SelectCourse(this.course);

  @override
  List<Object> get props => [course];
}
