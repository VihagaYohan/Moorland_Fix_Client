import 'package:moorland_fix/app/features/appointments/domain/entities/_index.dart';

class ServiceModel {
  final String _id;
  final String name;
  final int slotsPerDay;
  final bool wholeDayBooking;
  final String description;

  ServiceModel(
    this._id,
    this.name,
    this.slotsPerDay,
    this.wholeDayBooking,
    this.description,
  );

  Services toEntity() {
    return Services(
      uid: _id,
      name: name,
      slotsPerDay: slotsPerDay,
      wholeDayBooking: wholeDayBooking,
      description: description,
    );
  }
}
