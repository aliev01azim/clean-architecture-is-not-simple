import 'package:domain/src/models/article/user_model.dart';

abstract class AuthRepository {
  Future<UserModel> register();

  Future<int> save(String articles, String type);
}
