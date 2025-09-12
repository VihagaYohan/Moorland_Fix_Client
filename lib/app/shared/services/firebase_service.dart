import 'package:firebase_core/firebase_core.dart';

abstract class FirebaseService {
  Future<void> initialize();
  bool get isInitialized;
  FirebaseApp get appInstance;
}