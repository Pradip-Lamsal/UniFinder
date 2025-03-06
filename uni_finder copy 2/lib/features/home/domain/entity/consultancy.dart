import 'package:equatable/equatable.dart';

class Consultancy extends Equatable {
  final String id;
  final String name;
  final String details;

  const Consultancy({
    required this.id,
    required this.name,
    required this.details,
  });

  @override
  List<Object?> get props => [id, name, details];
}
