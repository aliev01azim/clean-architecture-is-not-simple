import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../di.dart';
import '../../domain/entities/auth_info/auth_info.dart';
import '../../domain/entities/auth_status/auth_status.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

typedef _Event = AuthEvent;
typedef _State = AuthState;
typedef _EventHandler = EventHandler<_Event, _State>;
typedef _Emitter = Emitter<_State>;

const _initialState = AuthState(
  info: AuthInfo.anonymous(),
  status: AuthStatus.none(),
);

@injectable
class AuthBloc extends Bloc<_Event, _State> {
  AuthBloc() : super(_initialState) {
    on<_Event>(_handler, transformer: droppable());
  }

  _EventHandler get _handler => (event, emit) => event.map(
        init: (event) => _handleInit(event, emit),
        register: (event) => _handleRegistration(event, emit),
        logout: (event) => _handleLogout(event, emit),
      );

  Future<void> _handleInit(AuthInit _, _Emitter emit) async {
    // final username = await _authRepository.loadUsername();
    // final password = await _authRepository.loadPassword();

    // if (username != null && password != null) {
    //   await _authRepository
    //       .authenticate(username: username, password: password)
    //       .doOnRightAsync((sessionId) {
    //     final authInfo = AuthInfo.authenticated(
    //       sessionId: sessionId,
    //       name: username,
    //     );
    //     emit(AuthState(info: authInfo, status: const AuthStatus.none()));
    //   });
    // }
  }

  Future<void> _handleRegistration(AuthLogin event, _Emitter emit) async {
    emit(state.copyWith(status: const AuthStatus.processing()));
    di<AuthUseCase>().call(
        onSuccess: (UserModel model) {
          emit(state.copyWith(
              info: AuthInfo.registered(model: model),
              status: const AuthStatus.none()));
        },
        onFailure: (String error) => emit(state.copyWith(
            info: AuthInfo.error(error: error),
            status: const AuthStatus.failure())));
  }

  Future<void> _handleLogout(AuthLogout _, _Emitter emit) async {
    // await _authRepository.clear();
    emit(_initialState);
  }
}
