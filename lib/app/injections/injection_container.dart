import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:moorland_fix/app/features/appointments/data/data_sources/appointment_remote_impl.dart';
import 'package:moorland_fix/app/features/appointments/data/repositoryImpl/appointment_repositoryImpl.dart';
import 'package:moorland_fix/app/features/appointments/domain/repositories/appointment_repository.dart';
import 'package:moorland_fix/app/features/appointments/domain/usecases/_index.dart';
import 'package:moorland_fix/app/features/appointments/presentation/provider/appointments_provider.dart';
// data sources
import 'package:moorland_fix/app/features/auth/data/data_sources/auth_remote_access_impl.dart';
// domain repositories
import 'package:moorland_fix/app/features/auth/domain/repositories/auth_repository.dart';
// domain use cases
import 'package:moorland_fix/app/features/auth/domain/usecases/_index.dart';
// providers
import 'package:moorland_fix/app/features/auth/presentation/provider/auth_provider.dart';
// services
import 'package:moorland_fix/app/shared/services/index.dart';

// data repositories
import '../features/auth/data/repositoryImpl/auth_repositoryImpl.dart';

final GetIt getIt = GetIt.instance;

Future<void> init({required FirebaseOptions firebaseOptions}) async {
  // services
  getIt.registerLazySingleton<FirebaseService>(
    () => FirebaseServiceImpl(firebaseOptions),
  );

  // initialize firebase
  getIt<FirebaseService>().initialize();

  getIt.registerLazySingleton(() => GoogleSignIn.standard());
  // getIt.registerLazySingleton(() => FirebaseServiceImpl(firebaseOptions))

  /*
  * data source implementations
  * */
  // auth remote data access implementation
  getIt.registerLazySingleton<AuthRemoteImpl>(
    () => AuthRemoteImpl(googleSignIn: getIt()),
  );
  // appointment remote data access implementation
  getIt.registerLazySingleton<AppointmentRemoteImpl>(
    () => AppointmentRemoteImpl(getIt<FirebaseService>().firestoreInstance),
  );

  /*
  * domain repositories
  * */
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(getIt<AuthRemoteImpl>()),
  );
  getIt.registerLazySingleton<AppointmentRepository>(
    () => AppointmentRepositoryImpl(getIt<AppointmentRemoteImpl>()),
  );

  // providers
  getIt.registerLazySingleton<AuthProvider>(
    () => AuthProvider(signInWithGoogle: getIt()),
  );
  getIt.registerLazySingleton<AppointmentProvider>(
    () => AppointmentProvider(
      allServices: getIt(),
      addBooking: getIt(),
      getBookingDates: getIt(),
    ),
  );

  // use cases
  getIt.registerLazySingleton(() => SignInWithGoogle(getIt<AuthRepository>()));
  getIt.registerLazySingleton(
    () => AllServices(getIt<AppointmentRepository>()),
  );
  getIt.registerLazySingleton(() => AddBooking(getIt<AppointmentRepository>()));
  getIt.registerLazySingleton(
    () => GetBookingDates(getIt<AppointmentRepository>()),
  );
}
