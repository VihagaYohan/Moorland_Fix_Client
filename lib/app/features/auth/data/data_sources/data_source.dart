import 'package:moorland_fix/app/shared/index.dart';

// model
import '../models/user_model.dart';

abstract class DataSource {
  Future<Result<UserModel>> signInWithGoogle();
  Future<Result<void>> signOut();
}