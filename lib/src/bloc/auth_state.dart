part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLoaded extends AuthState {
  final UserModel user;

  AuthLoaded(this.user);
  @override
  List<Object> get props => [];
}

class AuthLoading extends AuthState {
  final String text;
  AuthLoading(this.text);
  @override
  List<Object> get props => [text];
}

class AuthError extends AuthState {
  final String error;

  AuthError(this.error);
  @override
  List<Object> get props => [error];
}
