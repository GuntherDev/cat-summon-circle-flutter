import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:cat_summon_circle_flutter/entities/model/cat.dart';

part 'endpoint_cat.g.dart';

@RestApi(baseUrl: "https://cataas.com/cat/")
abstract class EndpointCat {
  factory EndpointCat(Dio dio, {String baseUrl}) = _EndpointCat;

  @GET("{cat}/json")
  Future<Cat> getCat(@Path("cat") String cat);
}
