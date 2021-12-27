// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'endpoint_cat.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _EndpointCat implements EndpointCat {
  _EndpointCat(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://cataas.com/cat/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Cat> getCat(cat) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<Cat>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '${cat}/json',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Cat.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
