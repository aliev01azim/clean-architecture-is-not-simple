import 'package:cache/src/db/demo_db.dart';
import 'package:injectable/injectable.dart';

@singleton
class DBProvider {
  DBProvider(this.db);

  final DemoDB db;

  Future<int> saveUser(String articles, String type) async {
    return await db.articlesDao.insertArticles(UserEntityCompanion.insert(
      content: articles,
      type: type,
      updated: DateTime.now(),
    ));
  }

  Future<String> fetchUser(String type) async {
    final User? articles = await db.articlesDao.fetchUser(type);
    return articles?.content ?? '';
  }
}
