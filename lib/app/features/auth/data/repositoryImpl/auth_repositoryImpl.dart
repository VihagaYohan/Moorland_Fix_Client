import 'package:moorland_fix/app/features/auth/domain/entities/user_entity.dart';
import 'package:moorland_fix/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:moorland_fix/app/shared/result.dart';

import '../data_sources/data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final DataSource _dataSource;

  AuthRepositoryImpl(this._dataSource);

  @override
  Future<Result<UserEntity>> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<Result<UserEntity>> signInWithGoogle() async {
    // TODO: implement signInWithGoogle
    var result = await _dataSource.signInWithGoogle();
    if(result.isError) {
      return Result.failure(result.error);
    }
    return Result.success(result.data!.toEntity());
  }

  @override
  Future<Result<void>> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

}