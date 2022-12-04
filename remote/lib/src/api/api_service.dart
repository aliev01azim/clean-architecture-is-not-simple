import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ApiService {
  @singleton
  Dio init() {
    Dio dio = Dio();
    dio.interceptors.add(ApiInterceptors());
    dio.options.baseUrl = "https://dasta.vilion-k.ru/api/v1";
    return dio;
  }
}

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    developer.log('REQUEST[${options.method}] => PATH: ${options.path}');
    developer.log('REQUEST[${options.toString()}]');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    developer.log(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    developer.log('RESPONSE[${response.toString()}]');
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    developer.log(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    developer.log('ERROR[${err.response?.toString()}]');
    return super.onError(err, handler);
  }
}
