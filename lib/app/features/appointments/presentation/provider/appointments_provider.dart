import 'package:flutter/material.dart';

class AppointmentProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Exception? _error = null;
  Exception? get getError => _error;

  Future<void> getServices() async {
    _isLoading = true;


  }
}