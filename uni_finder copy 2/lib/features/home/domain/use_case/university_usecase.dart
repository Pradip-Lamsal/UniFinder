// ignore: unused_import
import '../entity/university.dart' show University;

abstract class UniversityUsecase {
  Future<List<University>> getConsultancies();
}

class FetchConsultanciesUseCase {
  final UniversityUsecase repository;
  FetchConsultanciesUseCase(this.repository);
}
