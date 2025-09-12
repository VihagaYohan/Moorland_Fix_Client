class FirebaseAuthService {
  // private static instance
  static FirebaseAuthService? _instance;

  // private constructor
  FirebaseAuthService._internal();

  // factory constructor that returns the single instance
  factory FirebaseAuthService() {
    return _instance ??= FirebaseAuthService._internal();
  }
}