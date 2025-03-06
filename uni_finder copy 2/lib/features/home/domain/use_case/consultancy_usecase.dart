import '../entity/consultancy.dart' show Consultancy;

abstract class ConsultanciesRepository {
  Future<List<Consultancy>> getConsultancies();
}

class FetchConsultanciesUseCase {
  final ConsultanciesRepository repository;
  FetchConsultanciesUseCase(this.repository);

  //Future<List<Consultancy>> call() => repository.getConsultancies();
}
