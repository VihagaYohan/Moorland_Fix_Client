// entities
import 'package:moorland_fix/app/features/appointments/domain/entities/_index.dart';

class AppointmentRequest {
  String userId;
  Services service;
  DateTime selectedDate;
  TimeSlot timeSlot;
  String postCode;
  String contactNumber;
  String notes;
  String status;

  AppointmentRequest({
    required this.userId,
    required this.service,
    required this.selectedDate,
    required this.timeSlot,
    required this.postCode,
    required this.contactNumber,
    required this.notes,
    required this.status,
  });
}
