import 'package:pragma_jmancilla/features/search_cats/data/datasources/remote_data_source.dart';
import '../../domain/repositories/cat_repository.dart';
import '../models/cat_model.dart';

class CatRepositoryImpl implements CatRepository {
  final CatRemoteDataSource remoteDataSource;

  CatRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<CatModel>> getCats([int page = 0]) async {
    return await remoteDataSource.getCats(page);
  }

  @override
  Future<List<CatModel>> filterCats(String value) async {
    return await remoteDataSource.filterCats(value);
  }

  @override
  Future<String> getCatImageUrl(String imageId) async {
    return await remoteDataSource.getCatImageUrl(imageId);
  }
}
