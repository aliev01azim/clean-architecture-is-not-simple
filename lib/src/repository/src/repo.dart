import 'package:dfunc/dfunc.dart';

import 'api_client.dart';
import 'models/user_model.dart';

abstract class RegisterRepository {
  // регистрация включает в себя регистрацию и активацию кода
  AsyncResult<UserModel> register(Map<String, dynamic> map);
  AsyncResult<String> activateCode(String code);
}

class RegisterRepositoryImpl implements RegisterRepository {
  RegisterRepositoryImpl({RegisterApiClientImpl? registerApiClient})
      : _registerApiClient = registerApiClient ?? RegisterApiClientImpl();
  final RegisterApiClientImpl _registerApiClient;
  @override
  AsyncResult<UserModel> register(Map<String, dynamic> map) async =>
      await _registerApiClient.register(map);
  @override
  AsyncResult<String> activateCode(String code) async =>
      await _registerApiClient.activateCode(code);
  // @override
  // AsyncResult<UserModel> login(String password,String email) async =>
  //     await _authApiClient.activateCode(code);
}

abstract class LoginRepository {
  // регистрация включает в себя логин
  AsyncResult<UserModel> login(String password, String email);
}

class LoginRepositoryImpl implements LoginRepository {
  LoginRepositoryImpl({LoginApiClientImpl? loginApiClient})
      : _loginApiClient = loginApiClient ?? LoginApiClientImpl();
  final LoginApiClientImpl _loginApiClient;

  @override
  AsyncResult<UserModel> login(String password, String email) async =>
      await _loginApiClient.login(password, email);
}
