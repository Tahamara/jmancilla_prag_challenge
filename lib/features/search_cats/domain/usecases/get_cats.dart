

import 'package:pragma_jmancilla/features/search_cats/domain/repositories/cat_repository.dart';

import '../entities/cat.dart';

class GetCats {
  final CatRepository repository;

  GetCats(this.repository);

  Future<List<Cat>> call([int page = 0]) async {
    return await repository.getCats(page);
  }
}

