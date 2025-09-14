// entities
import 'package:moorland_fix/app/shared/index.dart';

import '../entities/_index.dart';

abstract class AuthRepository {
  Future<Result<UserEntity>> signInWithGoogle();
  Future<Result<void>> signOut();
  Future<Result<UserEntity>> getCurrentUser();
}