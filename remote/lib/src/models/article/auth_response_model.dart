import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:remote/src/models/article/user_model.dart';

part 'auth_response_model.freezed.dart';
part 'auth_response_model.g.dart';

@freezed
class AuthResponseModel with _$AuthResponseModel {
  const factory AuthResponseModel({
    required String status,
    required UserModel data,
  }) = _AuthResponseModel;
  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);
}
