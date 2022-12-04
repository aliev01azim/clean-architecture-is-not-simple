import 'package:cache/src/mapper/entity_mapper.dart';
import 'package:cache/src/models/user_model.dart';
import 'package:data/data.dart';
import 'package:injectable/injectable.dart';

@injectable
class ArticlesEntityMapper implements EntityMapper<UserModel, UserEntity> {
  @override
  UserEntity mapFromModel(UserModel articleModel) {
    return UserEntity(
      username: articleModel.username,
      password: articleModel.password,
      email: articleModel.email,
      phone: articleModel.phone,
      firstName: articleModel.firstName,
      lastName: articleModel.lastName,
      refreshToken: articleModel.refreshToken,
      id: articleModel.id,
      isActive: articleModel.isActive,
    );
  }
}
