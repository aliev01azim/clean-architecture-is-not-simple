import 'dart:async';

import 'package:dfunc/dfunc.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../helpers/exceptions.dart';
import '../../helpers/helper.dart';
import '../auth_repository.dart';

abstract class RegisterApiClient {
  AsyncResult<UserModel> register(Map<String, dynamic> map);
  AsyncResult<String> activateCode(String code);
}

abstract class LoginApiClient {
  AsyncResult<UserModel> login(String email, String password);
}

class RegisterApiClientImpl implements RegisterApiClient {
  @override
  AsyncResult<UserModel> register(Map<String, dynamic> map) async {
    try {
      final response = await dio.post(
        '/users/signup',
        data: map,
      );
      final bodyJson = response.data as Map<String, dynamic>;

      if (bodyJson.containsKey('status') && bodyJson['status'] == 'ok') {
        final user = bodyJson['data'] as Map<String, dynamic>;
        user['password'] = map['password'];
        await Hive.box('userBox').put('user', user);

        return Result.right(UserModel.fromJson(user));
      }
    } on DioError catch (e) {
      final bodyJson = e.response?.data as Map<String, dynamic>?;
      print(bodyJson);
      if (bodyJson != null) {
        return Result.left(RegisterRequestFailure(text: getError(bodyJson)));
      }
    } on Object catch (_) {
      print('object :$_');
      rethrow;
    }
    return const Result.left(RegisterRequestFailure());
  }

  @override
  AsyncResult<String> activateCode(String code) async {
    try {
      final response = await dio.get('/users/activation/$code');
      final bodyJson = response.data as Map<String, dynamic>;

      if (bodyJson.containsKey('status') && bodyJson['status'] == 'ok') {
        print('activated');
        final user = Hive.box('userBox').get('user', defaultValue: {});
        user['isActive'] = true;
        await Hive.box('userBox').put('user', user);
        return Result.right(bodyJson['message'] as String);
      }
    } on DioError catch (e) {
      final bodyJson = e.response?.data as Map<String, dynamic>?;
      print(bodyJson);
      if (bodyJson != null) {
        return Result.left(ActivationRequestFailure(text: getError(bodyJson)));
      }
    } on Object catch (_) {
      print('object :$_');
      rethrow;
    }
    return const Result.left(ActivationRequestFailure());
  }
}

class LoginApiClientImpl implements LoginApiClient {
  @override
  AsyncResult<UserModel> login(String password, String email) async {
    final data = {
      "password": password,
      "email": email,
    };
    try {
      final response = await dio.post(
        '/users/login',
        data: data,
      );
      final bodyJson = response.data as Map<String, dynamic>;

      if (bodyJson.containsKey('status') && bodyJson['status'] == 'ok') {
        final tokens = bodyJson['data'] as Map<String, dynamic>;
        final user = Hive.box('userBox').get('user', defaultValue: {});
        user['refreshToken'] = tokens['refreshToken'];
        user['accessToken'] = tokens['accessToken'];
        await Hive.box('userBox').put('user', user);
        return Result.right(UserModel.fromJson(user));
      }
    } on DioError catch (e) {
      final bodyJson = e.response?.data as Map<String, dynamic>?;
      print(bodyJson);
      if (bodyJson != null) {
        return Result.left(LoginRequestFailure(text: getError(bodyJson)));
      }
    } on Object catch (_) {
      print('object :$_');
      rethrow;
    }
    return const Result.left(LoginRequestFailure());
  }
}

String getError(Map<String, dynamic> errorResponse) {
  if (errorResponse['error'] is Map<String, dynamic>) {
    return (errorResponse['error'] as Map<String, dynamic>).values.join('. \n');
  }
  return errorResponse['error'];
}
