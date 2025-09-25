// repository
import '../repositories/appointment_repository.dart';

// entities
import '../entities/_index.dart';

// shared
import 'package:moorland_fix/app/shared/index.dart';

class GetBookingDates {
  final AppointmentRepository _repository;

  GetBookingDates(this._repository);

  Future<Result<List<TimeSlot>>> initiate(DateTime date) async {
    return _repository.getBookingDates(date);
  }
}