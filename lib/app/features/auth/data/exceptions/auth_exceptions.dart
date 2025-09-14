
abstract class AuthException implements Exception {
  final String message;

  AuthException(this.message);
}

class SignInException extends AuthException {
  SignInException(super.message);
}