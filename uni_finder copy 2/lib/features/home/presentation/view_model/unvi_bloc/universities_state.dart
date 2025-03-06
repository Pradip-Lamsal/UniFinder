import 'package:equatable/equatable.dart';

abstract class UniversitiesState extends Equatable {
  const UniversitiesState();

  @override
  List<Object> get props => [];
}

class UniversitiesLoading extends UniversitiesState {}

class UniversitiesLoaded extends UniversitiesState {
  final List<dynamic> universities;
  final dynamic selectedUniversity; // Store selected university

  const UniversitiesLoaded(this.universities, {this.selectedUniversity});

  @override
  List<Object> get props => [universities, selectedUniversity ?? {}];
}

class UniversitiesError extends UniversitiesState {
  final String message;

  const UniversitiesError(this.message);

  @override
  List<Object> get props => [message];
}
