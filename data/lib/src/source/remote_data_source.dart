import 'package:data/src/repository/auth_remote_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/user/user_entity.dart';
import 'data_source.dart';

@singleton
class RemoteDataSource extends DataSource {
  RemoteDataSource({required this.authRemoteRepository});

  final AuthRemoteRepository authRemoteRepository;

  Future<UserEntity> register() => authRemoteRepository.register();
}
