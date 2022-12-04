import 'dart:convert';
import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:remote/src/models/article/auth_response_model.dart';

@singleton
class EndpointProvider {
  EndpointProvider(this._dio);

  final Dio _dio;

  Future<AuthResponseModel> register() async {
    try {
      final response = await _dio.post(
        '/users/signup',
        // queryParameters: <String, String>{
        //   'api-key': 'ADD-YOUR-KEY'
        // }
      );

      return AuthResponseModel.fromJson(json.decode(response.toString()));
    } on DioError catch (ex) {
      developer.log(ex.message, stackTrace: ex.stackTrace);
      throw Exception(ex.message);
    }
  }
}
