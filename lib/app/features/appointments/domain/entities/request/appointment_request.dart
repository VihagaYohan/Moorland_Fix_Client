// entities
import 'package:moorland_fix/app/features/appointments/domain/entities/_index.dart';

class AppointmentRequest {
  String userId;
  Services service;
  DateTime selectedDate;
  TimeSlot timeSlot;
  String notes;
  String status;

  AppointmentRequest({
    required this.userId,
    required this.service,
    required this.selectedDate,
    required this.timeSlot,
    required this.notes,
    required this.status,
  });
}
