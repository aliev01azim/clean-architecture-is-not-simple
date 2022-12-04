import 'dart:convert';

import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../mock/mock_article_model.dart';
import 'get_auth_use_case_test.mocks.dart';

@GenerateMocks([
  AuthRepository,
])
void main() {
  late AuthRepository articlesRepository;
  late AuthUseCase getUserUseCase;

  setUp(() {
    articlesRepository = MockUserRepository();

    getUserUseCase = AuthUseCase(articlesRepository);
  });

  test(
      'should retrieve articles from MOST_EMAILED remote when there is no cached data and RequestType is RequestType.mostEmailed',
      () {
    final List<UserModel> results = mockUser;
    const String requestTypeValue = 'most-emailed';
    // Get from cache while empty
    when(articlesRepository.getCachedUser(requestTypeValue))
        .thenAnswer((_) async => <UserModel>[]);
    when(articlesRepository.save(json.encode(results), requestTypeValue))
        .thenAnswer((_) async => 1);

    when(articlesRepository.getMostEmailedUser())
        .thenAnswer((_) async => results);

    getUserUseCase.call(
        requestType: RequestType.mostEmailed,
        onSuccess: (List<UserModel> articles) {
          verify(articlesRepository.getMostEmailedUser()).called(1);

          expect(articles, isNotNull);
          expect(articles, results);
        },
        onFailure: () {});
  });

  test(
      'should retrieve articles from MOST_VIEWED remote when there is no cached data and RequestType is RequestType.mostViewed',
      () {
    final List<UserModel> results = mockUser;
    const String requestTypeValue = 'most-viewed';
    // Get from cache while empty
    when(articlesRepository.getCachedUser(requestTypeValue))
        .thenAnswer((_) async => <UserModel>[]);
    when(articlesRepository.save(json.encode(results), requestTypeValue))
        .thenAnswer((_) async => 1);

    when(articlesRepository.register()).thenAnswer((_) async => results);

    getUserUseCase.call(
        requestType: RequestType.mostViewed,
        onSuccess: (List<UserModel> articles) {
          verify(articlesRepository.register()).called(1);

          expect(articles, isNotNull);
          expect(articles, results);
        },
        onFailure: () {});
  });

  test(
      'should retrieve articles from MOST_SHARED remote when there is no cached data and RequestType is RequestType.mostShared',
      () {
    final List<UserModel> results = mockUser;
    const String requestTypeValue = 'most-shared';
    // Get from cache while empty
    when(articlesRepository.getCachedUser(requestTypeValue))
        .thenAnswer((_) async => <UserModel>[]);
    when(articlesRepository.save(json.encode(results), requestTypeValue))
        .thenAnswer((_) async => 1);

    when(articlesRepository.getMostSharedUser())
        .thenAnswer((_) async => results);

    getUserUseCase.call(
        requestType: RequestType.mostShared,
        onSuccess: (List<UserModel> articles) {
          verify(articlesRepository.getMostSharedUser()).called(1);

          expect(articles, isNotNull);
          expect(articles, results);
        },
        onFailure: () {});
  });

  test('should retrieve articles from cache when there is cached data', () {
    final List<UserModel> results = mockUser;
    const String requestTypeValue = 'most-emailed';
    // Get from cache while empty
    when(articlesRepository.getCachedUser(requestTypeValue))
        .thenAnswer((_) async => results);

    getUserUseCase.call(
        requestType: RequestType.mostEmailed,
        onSuccess: (List<UserModel> articles) {
          verify(articlesRepository.getCachedUser(requestTypeValue)).called(1);

          expect(articles, isNotNull);
          expect(articles, results);
        },
        onFailure: () {});
  });

  test('should retrieve articles from remote when forceUpdate is true', () {
    final List<UserModel> results = mockUser;
    const String requestTypeValue = 'most-emailed';

    when(articlesRepository.save(json.encode(results), requestTypeValue))
        .thenAnswer((_) async => 1);

    when(articlesRepository.getMostEmailedUser())
        .thenAnswer((_) async => results);

    getUserUseCase.call(
        requestType: RequestType.mostEmailed,
        forceUpdate: true,
        onSuccess: (List<UserModel> articles) {
          verifyNever(articlesRepository.getCachedUser(requestTypeValue));
          verify(articlesRepository.getMostEmailedUser()).called(1);

          expect(articles, isNotNull);
          expect(articles, results);
        },
        onFailure: () {});
  });

  // TODO: Test all scenarios
}
