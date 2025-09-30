// repository
import '../repositories/appointment_repository.dart';
// shared
import 'package:moorland_fix/app/shared/index.dart';
// entities
import '../entities/_index.dart';

class AllAppointments {
  final AppointmentRepository _repository;

  AllAppointments(this._repository);

  Future<Result<List<Appointment>>> initiate(String userId, String status) async {
    return _repository.allAppointments(userId, status);
  }
}