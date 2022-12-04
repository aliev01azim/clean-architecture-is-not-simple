import '../entities/user/user_entity.dart';

abstract class CacheStorageRepository {
  Future<int> saveUser(String contents, String type);

  Future<UserEntity> getUser(String type);
}
