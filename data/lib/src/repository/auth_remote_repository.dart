import '../entities/user/user_entity.dart';

abstract class AuthRemoteRepository {
  Future<UserEntity> register();
}
