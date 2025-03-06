import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/datasource/home_remote_datasource.dart';
import '../../view_model/unvi_bloc/universities_bloc.dart';
import '../../view_model/unvi_bloc/universities_event.dart';
import '../../view_model/unvi_bloc/universities_state.dart';

class UniversitiesView extends StatelessWidget {
  const UniversitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isTablet = MediaQuery.of(context).size.width > 600;

    return BlocProvider(
      create: (context) =>
          UniversitiesBloc(HomeRemoteDataSource())..add(FetchUniversities()),
      child: Scaffold(
        body: BlocBuilder<UniversitiesBloc, UniversitiesState>(
          builder: (context, state) {
            if (state is UniversitiesLoading) {
              return Center(
                  child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor));
            } else if (state is UniversitiesError) {
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
                        context
                            .read<UniversitiesBloc>()
                            .add(FetchUniversities());
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            } else if (state is UniversitiesLoaded) {
              final universities = state.universities;
              final selectedUniversity = state.selectedUniversity;

              if (selectedUniversity != null) {
                return _buildUniversityDetailView(context, selectedUniversity);
              }

              if (universities.isEmpty) {
                return Center(
                  child: Text(
                    "No universities found",
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
                itemCount: universities.length,
                itemBuilder: (context, index) {
                  final university = universities[index];
                  return GestureDetector(
                    onTap: () {
                      context
                          .read<UniversitiesBloc>()
                          .add(SelectUniversity(university));
                    },
                    child: buildUniversityCard(context, university, index),
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

  Widget buildUniversityCard(
      BuildContext context, dynamic university, int index) {
    return Card(
      key: ValueKey(university['id'] ?? index),
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
              university["name"] ?? "Unknown University",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Theme.of(context).colorScheme.secondary,
                  size: 18,
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    university["location"] ?? "Unknown Location",
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  context
                      .read<UniversitiesBloc>()
                      .add(SelectUniversity(university));
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

  Widget _buildUniversityDetailView(BuildContext context, dynamic university) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.read<UniversitiesBloc>().add(FetchUniversities());
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
                    university["name"] ?? "Unknown University",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                  const SizedBox(height: 8),
                  _buildDetailRow(
                    Icons.location_on,
                    "Location",
                    university["location"] ?? "Unknown Location",
                    context,
                  ),
                  const SizedBox(height: 8),
                  _buildDetailRow(
                    Icons.school,
                    "Type",
                    university["type"] ?? "Not specified",
                    context,
                  ),
                  _buildDetailRow(
                    Icons.email,
                    "Contact",
                    university["contact"] ?? "Not available",
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
