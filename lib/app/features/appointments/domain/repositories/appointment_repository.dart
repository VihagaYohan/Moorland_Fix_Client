import 'package:moorland_fix/app/shared/index.dart';
import '../entities/_index.dart';

abstract class AppointmentRepository {
  Future<Result<List<Services>>> allServices();
  Future<Result<void>> reserveAppointment(AppointmentRequest payload);
  Future<Result<dynamic>> getBookingDates(DateTime date);
  Future<Result<List<Appointment>>> allAppointments(String userId, String status, [bool isAdmin = false]);
  Future<Result<dynamic>> updateAppointment(Appointment payload);
}