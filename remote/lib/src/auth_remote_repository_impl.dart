import 'package:data/data.dart';
import 'package:injectable/injectable.dart';
import 'package:remote/src/api/auth_service.dart';
import 'package:remote/src/mapper/articles_entity_mapper.dart';
import 'package:remote/src/models/article/auth_response_model.dart';

@Injectable(as: AuthRemoteRepository)
class AuthRepositoryImpl extends AuthRemoteRepository {
  AuthRepositoryImpl({
    required this.authService,
    required this.authEntityMapper,
  });

  final AuthService authService;
  final ArticlesEntityMapper authEntityMapper;

  @override
  Future<UserEntity> register() async {
    final AuthResponseModel articlesResponseModel =
        await authService.register();
    return _getMappedUser(articlesResponseModel);
  }

  UserEntity _getMappedUser(AuthResponseModel articlesResponseModel) =>
      authEntityMapper.mapFromModel(articlesResponseModel.data);
}
