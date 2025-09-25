import 'package:moorland_fix/app/shared/index.dart';
import '../entities/_index.dart';

abstract class AppointmentRepository {
  Future<Result<List<Services>>> allServices();
  Future<Result<void>> reserveAppointment(AppointmentRequest payload);
  Future<Result<List<TimeSlot>>> getBookingDates(DateTime date);
}