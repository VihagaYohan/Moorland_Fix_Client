// repository
import '../repositories/appointment_repository.dart';
// entities
import '../entities/_index.dart';

// shared
import 'package:moorland_fix/app/shared/index.dart';

class AddBooking {
  final AppointmentRepository _repository;

  AddBooking(this._repository);

  Future<Result<void>> initiate(AppointmentRequest payload) async {
    return _repository.reserveAppointment(payload);
  }
}