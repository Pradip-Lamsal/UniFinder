import 'package:equatable/equatable.dart';

abstract class ConsultanciesEvent extends Equatable {
  const ConsultanciesEvent();

  @override
  List<Object> get props => [];
}

class FetchConsultancies extends ConsultanciesEvent {}

class SelectConsultancy extends ConsultanciesEvent {
  final dynamic consultancy;

  const SelectConsultancy(this.consultancy);

  @override
  List<Object> get props => [consultancy];
}
