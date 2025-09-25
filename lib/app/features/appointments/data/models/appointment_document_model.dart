// model
// entities
import 'package:moorland_fix/app/features/appointments/domain/entities/_index.dart';

import './_index.dart';

class AppointmentDocument {
  final DateTime date;
  final List<TimeSlotModel> bookedSlots;
  final List<AppointmentModel> appointments;

  AppointmentDocument({
    required this.date,
    required this.bookedSlots,
    required this.appointments,
  });

  factory AppointmentDocument.fromJson(
    String docId,
    Map<String, dynamic> json,
  ) {
    // convert date from String to DateTime
    final parts = docId.split('-');
    final day = int.parse(parts[0]);
    final month = int.parse(parts[1]);
    final year = int.parse(parts[2]);

    return AppointmentDocument(
      date: DateTime(year, month, day),
      bookedSlots:
          (json['bookedSlots'] as List<dynamic>? ?? [])
              .map((slot) => TimeSlotModel.fromJson(slot))
              .toList(),
      appointments:
          (json['appointments'] as List<dynamic>? ?? [])
              .map((appt) => AppointmentModel.fromJson(appt))
              .toList(),
    );
  }

  AppointmentDocumentEntity toEntity() {
    return AppointmentDocumentEntity(
      date: date,
      bookedSlots:
          (bookedSlots as List<TimeSlotModel>)
              .map((slot) => slot.toEntity())
              .toList(),
      appointments:
          (appointments as List<AppointmentModel>)
              .map((appt) => appt.toEntity())
              .toList(),
    );
  }
}
