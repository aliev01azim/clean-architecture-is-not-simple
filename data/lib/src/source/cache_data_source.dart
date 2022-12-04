import 'package:data/src/repository/cache_storage_repository.dart';
import 'package:data/src/source/data_source.dart';
import 'package:injectable/injectable.dart';

import '../entities/user/user_entity.dart';

@singleton
class CacheDataSource extends DataSource {
  CacheDataSource(this.cacheStorageRepository);

  final CacheStorageRepository cacheStorageRepository;

  Future<int> saveUser(String contents, String type) =>
      cacheStorageRepository.saveUser(contents, type);

  Future<List<UserEntity>> getArticles(String type) =>
      cacheStorageRepository.getUser(type);
}
