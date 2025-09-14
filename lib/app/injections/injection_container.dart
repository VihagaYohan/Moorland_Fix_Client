import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:moorland_fix/app/features/auth/data/data_sources/auth_remote_access_impl.dart';
import 'package:moorland_fix/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:moorland_fix/app/features/auth/domain/usecases/_index.dart';
// services
import 'package:moorland_fix/app/shared/services/index.dart';

final GetIt getIt = GetIt.instance;

Future<void> init({required FirebaseOptions firebaseOptions}) async {
  // services
  getIt.registerLazySingleton<FirebaseService>(
    () => FirebaseServiceImpl(firebaseOptions),
  );

  // initialize firebase
  await getIt<FirebaseService>().initialize();

  getIt.registerLazySingleton(() => GoogleSignIn.standard());

  getIt.registerLazySingleton<AuthRemoteImpl>(
    () => AuthRemoteImpl(googleSignIn: getIt()),
  );

  // usecases
  getIt.registerLazySingleton(() => SignInWithGoogle(getIt<AuthRepository>()));
}
