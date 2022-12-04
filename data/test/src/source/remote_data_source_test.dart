import 'package:data/src/entities/user/user_entity.dart';
import 'package:data/src/repository/auth_remote_repository.dart';
import 'package:data/src/source/remote_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../mock/mock_article_entity.dart';
import 'remote_data_source_test.mocks.dart';

@GenerateMocks([
  AuthRemoteRepository,
])
void main() {
  late AuthRemoteRepository authRemoteRepository;
  late RemoteDataSource remoteDataSource;

  setUp(() {
    authRemoteRepository = MockArticlesRemoteRepository();

    remoteDataSource =
        RemoteDataSource(authRemoteRepository: authRemoteRepository);
  });

  test('should get most viewed list of articles upon retrieval from remote',
      () async {
    when(authRemoteRepository.register()).thenAnswer((_) async => mockArticles);

    final UserEntity articles = await remoteDataSource.register();
    expect(articles, isNotNull);
    // expect(articles.length, same(1));

    verify(authRemoteRepository.register()).called(1);
  });
}
