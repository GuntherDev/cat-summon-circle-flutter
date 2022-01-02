import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:cat_summon_circle_flutter/entities/model/cat.dart';

part 'endpoint_cat.g.dart';

@RestApi(baseUrl: "https://cataas.com")
abstract class EndpointCat {
  factory EndpointCat(Dio dio, {String baseUrl}) = _EndpointCat;

  @GET("/cat/gif?json=true")
  Future<Cat> getCat();
}
