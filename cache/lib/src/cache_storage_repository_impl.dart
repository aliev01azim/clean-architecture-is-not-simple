import 'dart:convert';

import 'package:cache/src/db_provider.dart';
import 'package:cache/src/mapper/user_entity_mapper.dart';
import 'package:cache/src/models/user_model.dart';
import 'package:data/data.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CacheStorageRepository)
class CacheStorageRepositoryImpl implements CacheStorageRepository {
  CacheStorageRepositoryImpl(
      {required this.dbProvider, required this.articlesEntityMapper});

  final DBProvider dbProvider;
  final ArticlesEntityMapper articlesEntityMapper;

  @override
  Future<List<UserEntity>> getUser(String type) async {
    final String? contents = await dbProvider.fetchUser(type);

    if (contents == null || contents.isEmpty) return <UserEntity>[];

    return (json.decode(contents) as List)
        .map((i) => articlesEntityMapper.mapFromModel(UserModel.fromJson(i)))
        .toList();
  }

  @override
  Future<int> saveUser(String contents, String type) async =>
      dbProvider.saveUser(contents, type);
}
