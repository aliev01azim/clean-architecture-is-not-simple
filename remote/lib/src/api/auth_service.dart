import 'package:injectable/injectable.dart';
import 'package:remote/src/api/endpoint_provider.dart';
import 'package:remote/src/models/article/auth_response_model.dart';

@singleton
class AuthService {
  AuthService(this.endpointProvider);

  final EndpointProvider endpointProvider;

  Future<AuthResponseModel> register() async => endpointProvider.register();
}
