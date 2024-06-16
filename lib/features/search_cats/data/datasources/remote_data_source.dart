import 'package:dio/dio.dart';
import 'package:pragma_jmancilla/core/Constants.dart';
import 'package:pragma_jmancilla/core/exceptions/exceptions.dart';
import '../models/cat_model.dart';

abstract class CatRemoteDataSource {
  Future<List<CatModel>> getCats([int page = 0]);

  Future<List<CatModel>> filterCats(String value);

  Future<String> getCatImageUrl(String imageId);
}

class CatRemoteDataSourceImpl implements CatRemoteDataSource {
  final Dio dio;

  CatRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<CatModel>> getCats([int page = 0]) async {
    Map<String, String?> headers = {'x-api-key': Constants.API_KEY};
    try {
      final response = await dio.get('https://api.thecatapi.com/v1/breeds',
          queryParameters: {
            'page': '$page',
            'limit': 10,
          },
          options: Options(
            headers: headers,
            receiveDataWhenStatusError: true,
          ));
      return (response.data as List)
          .map((json) => CatModel.fromJson(json))
          .toList();
    } catch (e) {
      throw CustomException('Error en la peticion');
    }
  }

  @override
  Future<List<CatModel>> filterCats(String value) async {
    Map<String, String?> headers = {'x-api-key': Constants.API_KEY};
    try {
      final response =
          await dio.get('https://api.thecatapi.com/v1/breeds/search',
              queryParameters: {
                'q': value,
                'attach_image': '1',
              },
              options: Options(
                headers: headers,
                receiveDataWhenStatusError: true,
              ));
      return (response.data as List)
          .map((json) => CatModel.fromJson(json))
          .toList();
    } catch (e) {
      throw CustomException('Error en la peticion');
    }
  }

  @override
  Future<String> getCatImageUrl(String imageId) async {
    Map<String, String?> headers = {'x-api-key': Constants.API_KEY};
    try {
      final response =
          await dio.get('https://api.thecatapi.com/v1/images/$imageId',
              options: Options(
                headers: headers,
                receiveDataWhenStatusError: true,
              ));
      return response.data['url'];
    } catch (e) {
      throw CustomException('Error en la peticion');
    }
  }
}
