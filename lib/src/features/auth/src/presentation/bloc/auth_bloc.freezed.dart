// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String username, String? firstname,
            String? lastname, String password, String email, String phone)
        register,
    required TResult Function() logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String username, String? firstname, String? lastname,
            String password, String email, String phone)?
        register,
    TResult? Function()? logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String username, String? firstname, String? lastname,
            String password, String email, String phone)?
        register,
    TResult Function()? logout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInit value) init,
    required TResult Function(AuthLogin value) register,
    required TResult Function(AuthLogout value) logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInit value)? init,
    TResult? Function(AuthLogin value)? register,
    TResult? Function(AuthLogout value)? logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInit value)? init,
    TResult Function(AuthLogin value)? register,
    TResult Function(AuthLogout value)? logout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AuthInitCopyWith<$Res> {
  factory _$$AuthInitCopyWith(
          _$AuthInit value, $Res Function(_$AuthInit) then) =
      __$$AuthInitCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthInitCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthInit>
    implements _$$AuthInitCopyWith<$Res> {
  __$$AuthInitCopyWithImpl(_$AuthInit _value, $Res Function(_$AuthInit) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthInit implements AuthInit {
  const _$AuthInit();

  @override
  String toString() {
    return 'AuthEvent.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthInit);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String username, String? firstname,
            String? lastname, String password, String email, String phone)
        register,
    required TResult Function() logout,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String username, String? firstname, String? lastname,
            String password, String email, String phone)?
        register,
    TResult? Function()? logout,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String username, String? firstname, String? lastname,
            String password, String email, String phone)?
        register,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInit value) init,
    required TResult Function(AuthLogin value) register,
    required TResult Function(AuthLogout value) logout,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInit value)? init,
    TResult? Function(AuthLogin value)? register,
    TResult? Function(AuthLogout value)? logout,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInit value)? init,
    TResult Function(AuthLogin value)? register,
    TResult Function(AuthLogout value)? logout,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class AuthInit implements AuthEvent {
  const factory AuthInit() = _$AuthInit;
}

/// @nodoc
abstract class _$$AuthLoginCopyWith<$Res> {
  factory _$$AuthLoginCopyWith(
          _$AuthLogin value, $Res Function(_$AuthLogin) then) =
      __$$AuthLoginCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String username,
      String? firstname,
      String? lastname,
      String password,
      String email,
      String phone});
}

/// @nodoc
class __$$AuthLoginCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthLogin>
    implements _$$AuthLoginCopyWith<$Res> {
  __$$AuthLoginCopyWithImpl(
      _$AuthLogin _value, $Res Function(_$AuthLogin) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? password = null,
    Object? email = null,
    Object? phone = null,
  }) {
    return _then(_$AuthLogin(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      firstname: freezed == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String?,
      lastname: freezed == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String?,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthLogin implements AuthLogin {
  const _$AuthLogin(
      {required this.username,
      this.firstname,
      this.lastname,
      required this.password,
      required this.email,
      required this.phone});

  @override
  final String username;
  @override
  final String? firstname;
  @override
  final String? lastname;
  @override
  final String password;
  @override
  final String email;
  @override
  final String phone;

  @override
  String toString() {
    return 'AuthEvent.register(username: $username, firstname: $firstname, lastname: $lastname, password: $password, email: $email, phone: $phone)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthLogin &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.firstname, firstname) ||
                other.firstname == firstname) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, username, firstname, lastname, password, email, phone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthLoginCopyWith<_$AuthLogin> get copyWith =>
      __$$AuthLoginCopyWithImpl<_$AuthLogin>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String username, String? firstname,
            String? lastname, String password, String email, String phone)
        register,
    required TResult Function() logout,
  }) {
    return register(username, firstname, lastname, password, email, phone);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String username, String? firstname, String? lastname,
            String password, String email, String phone)?
        register,
    TResult? Function()? logout,
  }) {
    return register?.call(
        username, firstname, lastname, password, email, phone);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String username, String? firstname, String? lastname,
            String password, String email, String phone)?
        register,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (register != null) {
      return register(username, firstname, lastname, password, email, phone);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInit value) init,
    required TResult Function(AuthLogin value) register,
    required TResult Function(AuthLogout value) logout,
  }) {
    return register(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInit value)? init,
    TResult? Function(AuthLogin value)? register,
    TResult? Function(AuthLogout value)? logout,
  }) {
    return register?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInit value)? init,
    TResult Function(AuthLogin value)? register,
    TResult Function(AuthLogout value)? logout,
    required TResult orElse(),
  }) {
    if (register != null) {
      return register(this);
    }
    return orElse();
  }
}

abstract class AuthLogin implements AuthEvent {
  const factory AuthLogin(
      {required final String username,
      final String? firstname,
      final String? lastname,
      required final String password,
      required final String email,
      required final String phone}) = _$AuthLogin;

  String get username;
  String? get firstname;
  String? get lastname;
  String get password;
  String get email;
  String get phone;
  @JsonKey(ignore: true)
  _$$AuthLoginCopyWith<_$AuthLogin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthLogoutCopyWith<$Res> {
  factory _$$AuthLogoutCopyWith(
          _$AuthLogout value, $Res Function(_$AuthLogout) then) =
      __$$AuthLogoutCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthLogoutCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthLogout>
    implements _$$AuthLogoutCopyWith<$Res> {
  __$$AuthLogoutCopyWithImpl(
      _$AuthLogout _value, $Res Function(_$AuthLogout) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthLogout implements AuthLogout {
  const _$AuthLogout();

  @override
  String toString() {
    return 'AuthEvent.logout()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthLogout);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String username, String? firstname,
            String? lastname, String password, String email, String phone)
        register,
    required TResult Function() logout,
  }) {
    return logout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String username, String? firstname, String? lastname,
            String password, String email, String phone)?
        register,
    TResult? Function()? logout,
  }) {
    return logout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String username, String? firstname, String? lastname,
            String password, String email, String phone)?
        register,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInit value) init,
    required TResult Function(AuthLogin value) register,
    required TResult Function(AuthLogout value) logout,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInit value)? init,
    TResult? Function(AuthLogin value)? register,
    TResult? Function(AuthLogout value)? logout,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInit value)? init,
    TResult Function(AuthLogin value)? register,
    TResult Function(AuthLogout value)? logout,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class AuthLogout implements AuthEvent {
  const factory AuthLogout() = _$AuthLogout;
}

/// @nodoc
mixin _$AuthState {
  AuthInfo get info => throw _privateConstructorUsedError;
  AuthStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call({AuthInfo info, AuthStatus status});

  $AuthInfoCopyWith<$Res> get info;
  $AuthStatusCopyWith<$Res> get status;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as AuthInfo,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthStatus,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AuthInfoCopyWith<$Res> get info {
    return $AuthInfoCopyWith<$Res>(_value.info, (value) {
      return _then(_value.copyWith(info: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AuthStatusCopyWith<$Res> get status {
    return $AuthStatusCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AuthStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$$_AuthStateCopyWith(
          _$_AuthState value, $Res Function(_$_AuthState) then) =
      __$$_AuthStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthInfo info, AuthStatus status});

  @override
  $AuthInfoCopyWith<$Res> get info;
  @override
  $AuthStatusCopyWith<$Res> get status;
}

/// @nodoc
class __$$_AuthStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_AuthState>
    implements _$$_AuthStateCopyWith<$Res> {
  __$$_AuthStateCopyWithImpl(
      _$_AuthState _value, $Res Function(_$_AuthState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
    Object? status = null,
  }) {
    return _then(_$_AuthState(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as AuthInfo,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthStatus,
    ));
  }
}

/// @nodoc

class _$_AuthState implements _AuthState {
  const _$_AuthState({required this.info, required this.status});

  @override
  final AuthInfo info;
  @override
  final AuthStatus status;

  @override
  String toString() {
    return 'AuthState(info: $info, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthState &&
            (identical(other.info, info) || other.info == info) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, info, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthStateCopyWith<_$_AuthState> get copyWith =>
      __$$_AuthStateCopyWithImpl<_$_AuthState>(this, _$identity);
}

abstract class _AuthState implements AuthState {
  const factory _AuthState(
      {required final AuthInfo info,
      required final AuthStatus status}) = _$_AuthState;

  @override
  AuthInfo get info;
  @override
  AuthStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_AuthStateCopyWith<_$_AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}
