import 'package:firebase_core/firebase_core.dart';
import 'package:moorland_fix/app/shared/services/firebase_service.dart';

class FirebaseServiceImpl implements FirebaseService {
  bool _isInitialized = false;
  late final FirebaseOptions _firebaseOptions;
  late final FirebaseApp? _appInstance;

  FirebaseServiceImpl(FirebaseOptions firebaseOptions) {
    _firebaseOptions = firebaseOptions;
  }

  // initialize firebase
  @override
  Future<void> initialize() async {
    if (!_isInitialized) {
      _appInstance = await Firebase.initializeApp(options: _firebaseOptions);
      _isInitialized = true;
    }
  }

  @override
  bool get isInitialized => _isInitialized;

  // get firebase instance
  @override
  FirebaseApp get appInstance {
    if (_appInstance != null || _isInitialized) {
      return _appInstance!;
    } else {
      throw Exception("Firebase not initialized");
    }
  }
}
