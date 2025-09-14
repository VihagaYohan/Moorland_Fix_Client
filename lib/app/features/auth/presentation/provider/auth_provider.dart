import 'package:flutter/material.dart';

// usecases
import '../../domain/usecases/_index.dart';

// entity
import '../../domain/entities/_index.dart';

class AuthProvider extends ChangeNotifier {
  final SignInWithGoogle signInWithGoogle;

  AuthProvider({
    required this.signInWithGoogle,
});

  UserEntity? _currentUser;
  UserEntity? get currentUser => _currentUser;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Exception? _error = null;
  Exception? get getError => _error;

  Future<void> googleSignIn() async {
    _isLoading = true;

    final result = await signInWithGoogle();
    if(result.isSuccess) {
      _currentUser = result.data;
    } else {
      _error = result.error;
    }

    _isLoading = false;
    notifyListeners();
  }

}