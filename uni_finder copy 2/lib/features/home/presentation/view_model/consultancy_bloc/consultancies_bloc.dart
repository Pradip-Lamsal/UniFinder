import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/datasource/home_remote_datasource.dart';
import 'consultancies_event.dart';
import 'consultancies_state.dart';

class ConsultanciesBloc extends Bloc<ConsultanciesEvent, ConsultanciesState> {
  final HomeRemoteDataSource homeRemoteDataSource;

  ConsultanciesBloc(this.homeRemoteDataSource) : super(ConsultanciesLoading()) {
    on<FetchConsultancies>(_onFetchConsultancies);
    on<SelectConsultancy>(_onSelectConsultancy);
  }

  Future<void> _onFetchConsultancies(
      FetchConsultancies event, Emitter<ConsultanciesState> emit) async {
    emit(ConsultanciesLoading());
    try {
      final consultancies = await homeRemoteDataSource.fetchConsultancies();
      emit(ConsultanciesLoaded(consultancies));
    } catch (e) {
      emit(ConsultanciesError(e.toString()));
    }
  }

  void _onSelectConsultancy(
      SelectConsultancy event, Emitter<ConsultanciesState> emit) {
    if (state is ConsultanciesLoaded) {
      final currentState = state as ConsultanciesLoaded;
      emit(ConsultanciesLoaded(currentState.consultancies,
          selectedConsultancy: event.consultancy));
    }
  }
}
