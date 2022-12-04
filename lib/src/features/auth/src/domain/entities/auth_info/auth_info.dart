import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_info.freezed.dart';

@freezed
class AuthInfo with _$AuthInfo {
  const factory AuthInfo.authenticated({
    required String name,
  }) = Authenticated;

  const factory AuthInfo.registered({
    required UserModel model,
  }) = Registered;

  const factory AuthInfo.error({
    required String error,
  }) = Error;

  const factory AuthInfo.anonymous() = Anonymous;
}
