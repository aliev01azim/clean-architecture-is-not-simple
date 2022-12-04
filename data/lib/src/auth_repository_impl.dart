import 'package:data/src/mapper/articles/user_mapper.dart';
import 'package:data/src/source/data_source_factory.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import 'entities/user/user_entity.dart';

@Injectable(as: AuthRepository)
class ArticlesRepositoryImpl implements AuthRepository {
  ArticlesRepositoryImpl(
      {required this.dataSourceFactory, required this.userMapper});
  final DataSourceFactory dataSourceFactory;

  final UserMapper userMapper;

  @override
  Future<UserModel> register() async {
    final UserEntity articlesEntity =
        await dataSourceFactory.remoteDataSource.register();
    return _getMappedUser(articlesEntity);
  }

  @override
  Future<int> save(String articles, String type) async =>
      await dataSourceFactory.localDataSource.saveUser(articles, type);

  UserModel _getMappedUser(UserEntity articlesEntity) =>
      userMapper.mapFromEntity(articlesEntity);
}
