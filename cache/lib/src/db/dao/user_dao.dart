import 'package:cache/src/db/demo_db.dart';
import 'package:cache/src/db/entities/user_entity.dart';
import 'package:drift/drift.dart';

part 'user_dao.g.dart';

@DriftAccessor(tables: [ArticlesEntity])
class UserDao extends DatabaseAccessor<DemoDB> with _$UserDaoMixin {
  UserDao(DemoDB db) : super(db);

  Future<int> insertArticles(UserEntityCompanion entity) async {
    return into(userEntity).insertOnConflictUpdate(entity);
  }

  Future<User?> fetchUser(String type) async {
    return (select(userEntity)..where((tbl) => tbl.type.equals(type)))
        .getSingleOrNull();
  }
}
