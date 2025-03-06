import 'package:equatable/equatable.dart';

abstract class UniversitiesEvent extends Equatable {
  const UniversitiesEvent();

  @override
  List<Object> get props => [];
}

class FetchUniversities extends UniversitiesEvent {}

class SelectUniversity extends UniversitiesEvent {
  final dynamic university;

  const SelectUniversity(this.university);

  @override
  List<Object> get props => [university];
}
