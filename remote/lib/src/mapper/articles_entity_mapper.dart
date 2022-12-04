import 'package:data/data.dart';
import 'package:injectable/injectable.dart';
import 'package:remote/src/mapper/entity_mapper.dart';
import 'package:remote/src/models/article/user_model.dart';

@injectable
class ArticlesEntityMapper implements EntityMapper<UserModel, UserEntity> {
  @override
  UserEntity mapFromModel(UserModel articleModel) {
    return UserEntity(
        username: articleModel.username,
        password: articleModel.password,
        email: articleModel.email,
        phone: articleModel.phone,
        id: articleModel.id,
        isActive: articleModel.isActive,
        firstName: articleModel.firstName,
        lastName: articleModel.lastName,
        refreshToken: articleModel.refreshToken);
  }
}
