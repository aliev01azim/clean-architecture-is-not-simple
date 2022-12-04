import 'package:data/src/mapper/mapper.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../../entities/user/user_entity.dart';

@injectable
class UserMapper implements Mapper<UserEntity, UserModel> {
  @override
  UserModel mapFromEntity(UserEntity type) => UserModel(
      username: type.username,
      password: type.password,
      email: type.email,
      phone: type.phone,
      id: type.id,
      isActive: type.isActive,
      firstName: type.firstName,
      lastName: type.lastName,
      refreshToken: type.refreshToken);

  @override
  UserEntity mapToEntity(UserModel type) => UserEntity(
      username: type.username,
      password: type.password,
      email: type.email,
      phone: type.phone,
      id: type.id,
      isActive: type.isActive,
      firstName: type.firstName,
      lastName: type.lastName,
      refreshToken: type.refreshToken);
}
