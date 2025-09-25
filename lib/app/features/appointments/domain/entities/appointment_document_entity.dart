// model
import './_index.dart';

class AppointmentDocumentEntity {
  final DateTime date;
  final List<TimeSlot> bookedSlots;
  final List<Appointment> appointments;

  AppointmentDocumentEntity({
    required this.date,
    required this.bookedSlots,
    required this.appointments,
});
}