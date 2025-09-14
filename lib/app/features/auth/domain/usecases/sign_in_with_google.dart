import 'package:moorland_fix/app/features/auth/domain/entities/_index.dart';

import '../../../../shared/result.dart';
import '../repositories/auth_repository.dart';

class SignInWithGoogle {
  final AuthRepository _authRepository;

  SignInWithGoogle(this._authRepository);

  Future<Result<UserEntity>> call() async {
    return _authRepository.signInWithGoogle();
  }
}