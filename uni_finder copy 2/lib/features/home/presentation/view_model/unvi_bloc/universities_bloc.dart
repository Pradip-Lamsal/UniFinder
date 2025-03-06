import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/datasource/home_remote_datasource.dart';
import 'universities_event.dart';
import 'universities_state.dart';

class UniversitiesBloc extends Bloc<UniversitiesEvent, UniversitiesState> {
  final HomeRemoteDataSource homeRemoteDataSource;

  UniversitiesBloc(this.homeRemoteDataSource) : super(UniversitiesLoading()) {
    on<FetchUniversities>(_onFetchUniversities);
    on<SelectUniversity>(_onSelectUniversity);
  }

  Future<void> _onFetchUniversities(
      FetchUniversities event, Emitter<UniversitiesState> emit) async {
    emit(UniversitiesLoading());
    try {
      final universities = await homeRemoteDataSource.fetchUniversities();
      emit(UniversitiesLoaded(universities));
    } catch (e) {
      emit(UniversitiesError(e.toString()));
    }
  }

  void _onSelectUniversity(
      SelectUniversity event, Emitter<UniversitiesState> emit) {
    if (state is UniversitiesLoaded) {
      final currentState = state as UniversitiesLoaded;
      print(UniversitiesLoaded);
      emit(UniversitiesLoaded(currentState.universities,
          selectedUniversity: event.university));
    }
  }
}
