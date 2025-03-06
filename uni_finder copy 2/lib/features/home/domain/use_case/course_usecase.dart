// ignore: unused_import
import 'package:bus_application/features/home/domain/entity/course_entity.dart';

import '../entity/consultancy.dart' show Consultancy;

abstract class CourseUsecase {
  Future<List<Consultancy>> getConsultancies();
}

class FetchConsultanciesUseCase {
  final CourseUsecase repository;
  FetchConsultanciesUseCase(this.repository);
}
