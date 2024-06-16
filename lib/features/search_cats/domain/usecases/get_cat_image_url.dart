
import '../repositories/cat_repository.dart';

class GetCatImage {
  final CatRepository repository;

  GetCatImage(this.repository);

  Future<String> call(String value) async {
    return await repository.getCatImageUrl(value);
  }
}
