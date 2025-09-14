import 'package:moorland_fix/app/shared/services/index.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  // private static instance
  static late FirebaseAuth _instance;

  // private constructor
  FirebaseAuthService._internal() {
    // initialize firebase auth
    //_instance = FirebaseAuth.instanceFor(app: )
  }

  // factory constructor that returns the single instance
/*  factory FirebaseAuthService() {

    return _instance ??= FirebaseAuthService._internal();
  }*/
}