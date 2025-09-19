// models
import '../models/services_model.dart';
// shared
import 'package:moorland_fix/app/shared/index.dart';

class AppointmentRemoteImpl {
  Future<Result<List<ServiceModel>>> getAllServices() async {
    try {
      final List<ServiceModel> servicesList = [];
      return Result.success(servicesList);
    } catch (e) {
      return Result.failure(
        Exception("Unknown error at fetching services ${e.toString()}"),
      );
    }
  }
}
