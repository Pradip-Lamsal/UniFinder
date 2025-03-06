import 'package:hive/hive.dart';

import '../../domain/entity/consultancy.dart';

part 'consultancy_model.g.dart';

@HiveType(typeId: 2)
class ConsultancyModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String details;

  ConsultancyModel({
    required this.id,
    required this.name,
    required this.details,
  });

  factory ConsultancyModel.fromEntity(Consultancy consultancy) {
    return ConsultancyModel(
      id: consultancy.id,
      name: consultancy.name,
      details: consultancy.details,
    );
  }

  Consultancy toEntity() {
    return Consultancy(
      id: id,
      name: name,
      details: details,
    );
  }
}
