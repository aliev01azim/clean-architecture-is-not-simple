import 'package:auth/src/helpers/helpers.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required RegisterRepositoryImpl registerRepository,
    required LoginRepositoryImpl loginRepository,
  })  : _registerRepository = registerRepository,
        _loginRepository = loginRepository,
        super(AuthInitial()) {
    on<AuthRegisterEvent>((event, emit) async {
      emit(AuthLoading('Registration ...'));
      final data = {
        "username": event.username,
        "firstName": event.firstName,
        "lastName": event.lastName,
        "password": event.password,
        "email": event.email,
        "phone": event.phone,
      };
      final regResponse = await _registerRepository.register(data);
      await regResponse.fold(
        (exc) {
          if (exc is RegisterRequestFailure) {
            emit(AuthError(exc.text));
          }
        },
        (user) async {
          emit(AuthLoading('Code activation ...'));
          final actResponse =
              await _registerRepository.activateCode(user.activationCode);
          await actResponse.fold(
            (exc) {
              if (exc is ActivationRequestFailure) {
                emit(AuthError(exc.text));
              }
            },
            (message) /*это - success,code activated */ async {
              if (withLogin) {
                emit(AuthLoading('Logging in ...'));
                final loginResponse =
                    await _loginRepository.login(user.password, user.email);
                loginResponse.fold(
                  (exc) {
                    if (exc is LoginRequestFailure) {
                      emit(AuthError(exc.text));
                    }
                  },
                  (finishedUser) => emit(
                    AuthLoaded(finishedUser),
                  ),
                );
              } else {
                emit(AuthLoaded(user));
              }
            },
          );
          // emit(AuthLoaded(user));
        },
      );
    });
    on<AuthWithLoginEvent>((event, emit) {
      withLogin = event.withLogin;
    });
    on<AuthLoginEvent>((event, emit) async {
      emit(AuthLoading('Logging in ...'));
      final loginResponse =
          await _loginRepository.login(event.password, event.email);
      loginResponse.fold(
        (exc) {
          if (exc is LoginRequestFailure) {
            emit(AuthError(exc.text));
          }
        },
        (finishedUser) => emit(
          AuthLoaded(finishedUser),
        ),
      );
    });
    on<AuthLogoutEvent>((event, emit) async {
      await Hive.box('userBox').put('user', {});
      withLogin = false;
      emit(AuthInitial());
    });
  }
  final RegisterRepositoryImpl _registerRepository;
  final LoginRepositoryImpl _loginRepository;
  bool withLogin = false;
}
