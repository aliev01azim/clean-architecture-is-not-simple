import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@preResolve
class AuthUseCase {
  AuthUseCase(this.authRepository);

  final AuthRepository authRepository;

  Future<void> call({
    required Function(UserModel) onSuccess,
    required Function(String) onFailure,
  }) async {
    late UserModel articles;
    articles = await authRepository.register().then(
          (results) => onSuccess.call(articles),
          onError: (_) => onFailure.call(_.toString()),
        );
  }
}
