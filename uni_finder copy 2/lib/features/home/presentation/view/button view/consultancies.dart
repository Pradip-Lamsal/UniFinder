import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/datasource/home_remote_datasource.dart';
import '../../view_model/consultancy_bloc/consultancies_bloc.dart';
import '../../view_model/consultancy_bloc/consultancies_event.dart';
import '../../view_model/consultancy_bloc/consultancies_state.dart';

class ConsultanciesView extends StatelessWidget {
  const ConsultanciesView({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isTablet = MediaQuery.of(context).size.width > 600;

    return BlocProvider(
      create: (context) =>
          ConsultanciesBloc(HomeRemoteDataSource())..add(FetchConsultancies()),
      child: Scaffold(
        body: BlocBuilder<ConsultanciesBloc, ConsultanciesState>(
          builder: (context, state) {
            if (state is ConsultanciesLoading) {
              return Center(
                  child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor));
            } else if (state is ConsultanciesError) {
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
                            .read<ConsultanciesBloc>()
                            .add(FetchConsultancies());
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            } else if (state is ConsultanciesLoaded) {
              final consultancies = state.consultancies;
              final selectedConsultancy = state.selectedConsultancy;

              if (selectedConsultancy != null) {
                return _buildConsultancyDetailView(
                    context, selectedConsultancy);
              }

              if (consultancies.isEmpty) {
                return Center(
                  child: Text(
                    "No consultancies found",
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
                itemCount: consultancies.length,
                itemBuilder: (context, index) {
                  final consultancy = consultancies[index];
                  return GestureDetector(
                    onTap: () {
                      context
                          .read<ConsultanciesBloc>()
                          .add(SelectConsultancy(consultancy));
                    },
                    child: buildConsultancyCard(context, consultancy, index),
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

  Widget buildConsultancyCard(
      BuildContext context, dynamic consultancy, int index) {
    return Card(
      key: ValueKey(consultancy['name'] ?? index),
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
              consultancy["name"] ?? "Unknown Consultancy",
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
                    consultancy["location"] ?? "Unknown Location",
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
                      .read<ConsultanciesBloc>()
                      .add(SelectConsultancy(consultancy));
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

  Widget _buildConsultancyDetailView(
      BuildContext context, dynamic consultancy) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.read<ConsultanciesBloc>().add(FetchConsultancies());
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
                    consultancy["name"] ?? "Unknown Consultancy",
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
                    consultancy["location"] ?? "Unknown Location",
                    context,
                  ),
                  const SizedBox(height: 8),
                  _buildDetailRow(
                    Icons.phone,
                    "Contact",
                    consultancy["contact"] ?? "Not available",
                    context,
                  ),
                  const SizedBox(height: 8),
                  _buildDetailRow(
                    Icons.description,
                    "Description",
                    consultancy["description"] ?? "Not available",
                    context,
                  ),
                  const SizedBox(height: 8),
                  _buildDetailRow(
                    Icons.email,
                    "Courses",
                    (consultancy["services"] as List<dynamic>).isNotEmpty
                        ? (consultancy["services"] as List<dynamic>).join(", ")
                        : "Not available",
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
