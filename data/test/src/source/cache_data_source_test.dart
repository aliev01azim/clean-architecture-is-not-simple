import 'package:data/src/entities/user/user_entity.dart';
import 'package:data/src/repository/cache_storage_repository.dart';
import 'package:data/src/source/cache_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../mock/mock_article_entity.dart';
import 'cache_data_source_test.mocks.dart';

@GenerateMocks([
  CacheStorageRepository,
])
void main() {
  late CacheStorageRepository cacheStorageRepository;
  late CacheDataSource cacheDataSource;

  setUp(() {
    cacheStorageRepository = MockCacheStorageRepository();

    cacheDataSource = CacheDataSource(cacheStorageRepository);
  });

  test('should get int result when saving articles to db.', () async {
    final String randomType = randomString();
    final String randomContents = randomString(len: 100);
    when(cacheStorageRepository.saveUser(randomContents, randomType))
        .thenAnswer((_) async => 1);

    final int result =
        await cacheDataSource.saveUser(randomContents, randomType);
    expect(result, same(1));

    verify(cacheStorageRepository.saveUser(randomContents, randomType))
        .called(1);
  });

  test('should get list of articles from db.', () async {
    final String randomType = randomString();

    when(cacheStorageRepository.getUser(randomType))
        .thenAnswer((_) async => mockArticles);

    final List<UserEntity> articles =
        await cacheDataSource.getArticles(randomType);
    expect(articles, isNotNull);
    expect(articles.length, same(1));

    verify(cacheStorageRepository.getUser(randomType)).called(1);
  });
}
