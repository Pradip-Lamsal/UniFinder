import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../auth/domain/entity/course.dart';
import '../../../data/datasource/home_remote_datasource.dart';
import '../../../data/models/course_model.dart';
import 'courses_event.dart';
import 'courses_state.dart';

class CoursesBloc extends Bloc<CoursesEvent, CoursesState> {
  final HomeRemoteDataSource homeRemoteDataSource;

  CoursesBloc(this.homeRemoteDataSource) : super(CoursesLoading()) {
    on<FetchCourses>(_onFetchCourses);
    on<SelectCourse>(_onSelectCourse);
  }

  Future<void> _onFetchCourses(
      FetchCourses event, Emitter<CoursesState> emit) async {
    emit(CoursesLoading());
    try {
      // Fetch raw course data (likely List<dynamic> from API)
      final coursesJson = await homeRemoteDataSource.fetchCourse();

      // Map List<dynamic> to List<Course> with proper error handling
      final courses = coursesJson.map((json) {
        try {
          // Ensure each item is a Map<String, dynamic>
          if (json is! Map<String, dynamic>) {
            throw Exception('Invalid course data format: $json');
          }
          return CourseModel.fromJson(json).toEntity();
        } catch (e) {
          // Log the error for debugging
          print('Error deserializing course: $json, error: $e');
          // Fallback: Return a default Course object if deserialization fails
          return Course(
            id: (json['id'] ?? json['course name'] as dynamic).toString(),
            courseType: json['courseType'] ??
                json['type'] as String? ??
                'Unknown Course',
            courseCategory: json['courseCategory'] ??
                json['category'] as String? ??
                'Unknown Category',
          );
        }
      }).toList();

      // Emit the loaded state with the correctly typed List<Course>
      emit(CoursesLoaded(courses));
    } catch (e) {
      emit(CoursesError('Failed to load courses: ${e.toString()}'));
    }
  }

  void _onSelectCourse(SelectCourse event, Emitter<CoursesState> emit) {
    if (state is CoursesLoaded) {
      final currentState = state as CoursesLoaded;
      emit(CoursesLoaded(currentState.courses, selectedCourse: event.course));
    }
  }
}
