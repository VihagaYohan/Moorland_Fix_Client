import 'package:moorland_fix/app/features/appointments/domain/entities/_index.dart';

class ServiceModel {
  String id;
  String name;
  int slotsPerDay;
  bool wholeDayBooking;
  String description;

  ServiceModel(
      this.id,
      this.name,
      this.slotsPerDay,
      this.wholeDayBooking,
      this.description,
      );

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'slotsPerDay': slotsPerDay,
      'wholeDayBooking': wholeDayBooking,
      'description': description,
    };
  }

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      json['_id'],
      json['name'],
      json['slotsPerDay'],
      json['wholeDayBooking'],
      json['description'],
    );}

  Services toEntity() {
    return Services(
      uid: id,
      name: name,
      slotsPerDay: slotsPerDay,
      wholeDayBooking: wholeDayBooking,
      description: description,
    );
  }
}
