import 'package:cat_summon_circle_flutter/src/models/cat.dart';
import 'package:dio/dio.dart';

class CatRepository {
  final dio = Dio();

  Future<CatModel> fetchCat() async {
    const url = 'https://cataas.com/cat/gif?json=true';

    final response = await dio.get(url);
    CatModel catModel = CatModel.fromJson(response.data);
    return catModel;
  }

  Future<CatModel> fetchCatByTag(String tag) async {
    final url = 'https://cataas.com/cat/$tag?json=true';

    final response = await dio.get(url);
    CatModel catModel = CatModel.fromJson(response.data);
    return catModel;
  }
}
