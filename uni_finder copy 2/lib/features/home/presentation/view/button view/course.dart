import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../auth/domain/entity/course.dart';
import '../../../data/datasource/home_remote_datasource.dart';
import '../../view_model/course_bloc/courses_bloc.dart';
import '../../view_model/course_bloc/courses_event.dart';
import '../../view_model/course_bloc/courses_state.dart';

class CoursesView extends StatelessWidget {
  const CoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isTablet = MediaQuery.of(context).size.width > 600;

    return BlocProvider(
      create: (context) =>
          CoursesBloc(HomeRemoteDataSource())..add(FetchCourses()),
      child: Scaffold(
        body: BlocBuilder<CoursesBloc, CoursesState>(
          builder: (context, state) {
            if (state is CoursesLoading) {
              return Center(
                  child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor));
            } else if (state is CoursesError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Error: ${state.message}",
                      style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context.read<CoursesBloc>().add(FetchCourses());
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            } else if (state is CoursesLoaded) {
              final courses = state.courses;
              final selectedCourse = state.selectedCourse;

              if (selectedCourse != null) {
                return _buildCourseDetailView(context, selectedCourse);
              }

              if (courses.isEmpty) {
                return Center(
                  child: Text(
                    "No courses found",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                );
              }
              return GridView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isTablet ? 2 : 1,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: isTablet ? 2.2 : 2.5,
                ),
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  final course = courses[index];
                  return GestureDetector(
                    onTap: () {
                      context.read<CoursesBloc>().add(SelectCourse(course));
                    },
                    child: buildCourseCard(context, course, index),
                  );
                },
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget buildCourseCard(BuildContext context, Course course, int index) {
    return Card(
      key: ValueKey(course.id),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              course.courseType,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              course.courseCategory,
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  context.read<CoursesBloc>().add(SelectCourse(course));
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  elevation: 2,
                ),
                child: const Text(
                  "View Details",
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseDetailView(BuildContext context, Course course) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.read<CoursesBloc>().add(FetchCourses());
          },
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.courseType,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                  const SizedBox(height: 8),
                  _buildDetailRow(
                    Icons.category,
                    "Course Category",
                    course.courseCategory,
                    context,
                  ),
                  const SizedBox(height: 8),
                  _buildDetailRow(
                    Icons.person,
                    "Course Duration",
                    course.courseDuration,
                    context,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow(
      IconData icon, String title, String value, BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Theme.of(context).colorScheme.secondary),
        const SizedBox(width: 12),
        Text(
          "$title: $value",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
