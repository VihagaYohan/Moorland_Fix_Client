// repository
import '../repositories/appointment_repository.dart';
// entities
import '../entities/_index.dart';
// shared
import 'package:moorland_fix/app/shared/index.dart';

class UpdateBooking {
  final AppointmentRepository _repository;

  UpdateBooking(this._repository);

  Future<Result<void>> initiate(Appointment payload) async {
    return _repository.updateAppointment(payload);
  }
}