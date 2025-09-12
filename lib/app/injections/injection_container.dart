import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
// services
import 'package:moorland_fix/app/shared/services/index.dart';

final getIt = GetIt.instance;

Future<void> init({required FirebaseOptions firebaseOptions}) async {
  // services
  getIt.registerLazySingleton<FirebaseService>(
    () => FirebaseServiceImpl(firebaseOptions),
  );

  // initialize firebase
  await getIt<FirebaseService>().initialize();
}
