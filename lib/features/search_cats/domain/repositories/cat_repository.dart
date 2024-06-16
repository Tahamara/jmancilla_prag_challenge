import 'package:pragma_jmancilla/features/search_cats/domain/entities/cat.dart';

abstract class CatRepository {
  Future<List<Cat>> getCats([int page = 0]);

  Future<List<Cat>> filterCats(String value);

  Future<String> getCatImageUrl(String imageId);
}
