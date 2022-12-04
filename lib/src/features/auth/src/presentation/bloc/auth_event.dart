part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.init() = AuthInit;

  const factory AuthEvent.register({
    required String username,
    String? firstname,
    String? lastname,
    required String password,
    required String email,
    required String phone,
  }) = AuthLogin;

  const factory AuthEvent.logout() = AuthLogout;
}
