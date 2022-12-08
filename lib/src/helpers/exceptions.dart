abstract class ExceptionImpl implements Exception {
  final String text;
  const ExceptionImpl({this.text = "Произошла ошибка"});
}

class RegisterRequestFailure extends ExceptionImpl {
  const RegisterRequestFailure({super.text});
}

class ActivationRequestFailure extends ExceptionImpl {
  const ActivationRequestFailure({super.text});
}

class LoginRequestFailure extends ExceptionImpl {
  const LoginRequestFailure({super.text});
}
