
import '../entities/cat.dart';
import '../repositories/cat_repository.dart';

class FilterCats {
  final CatRepository repository;

  FilterCats(this.repository);

  Future<List<Cat>> call(String value) async {
    return await repository.filterCats(value);
  }
}
