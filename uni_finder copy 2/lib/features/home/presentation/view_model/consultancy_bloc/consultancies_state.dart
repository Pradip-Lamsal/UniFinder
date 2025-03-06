import 'package:equatable/equatable.dart';

abstract class ConsultanciesState extends Equatable {
  const ConsultanciesState();

  @override
  List<Object> get props => [];
}

class ConsultanciesLoading extends ConsultanciesState {}

class ConsultanciesLoaded extends ConsultanciesState {
  final List<dynamic> consultancies;
  final dynamic selectedConsultancy;

  const ConsultanciesLoaded(this.consultancies, {this.selectedConsultancy});

  @override
  List<Object> get props => [consultancies, selectedConsultancy ?? {}];
}

class ConsultanciesError extends ConsultanciesState {
  final String message;

  const ConsultanciesError(this.message);

  @override
  List<Object> get props => [message];
}
