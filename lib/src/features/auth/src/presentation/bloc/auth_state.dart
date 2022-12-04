part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required AuthInfo info,
    required AuthStatus status,
  }) = _AuthState;
}
