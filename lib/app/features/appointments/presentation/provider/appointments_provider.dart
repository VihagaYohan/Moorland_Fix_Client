import 'package:flutter/material.dart';
import 'package:moorland_fix/app/features/appointments/domain/entities/_index.dart';
// usecases
import 'package:moorland_fix/app/features/appointments/domain/usecases/_index.dart';

class AppointmentProvider extends ChangeNotifier {
  final AllServices allServices;

  AppointmentProvider({required this.allServices});

  // loading
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  // services
  List<Services> _services = [];

  List<Services> get services => _services;

  // error
  Exception? _error = null;

  Exception? get getError => _error;

  // isError
  bool _isError = false;
  bool get isError => _isError;

  Future<void> getServices() async {
    _isLoading = true;

final result = await allServices.initiate();
    if (result.isSuccess && result.data != null) {
      _services = result.data!;
    } else if (result.isSuccess && result.data!.isEmpty) {
      _isError = true;
      _error = Exception("No services found");
    } else {
      _isError = true;
      _error = result.error;
    }

    _isLoading = false;
    notifyListeners();
  }
}
