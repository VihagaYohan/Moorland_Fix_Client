// domain entities
// data models
import 'package:moorland_fix/app/features/appointments/data/models/_index.dart';
import 'package:moorland_fix/app/features/appointments/domain/entities/_index.dart';

class AppointmentModel {
  final String id;
  final String userId;
  final ServiceModel service;
  final DateTime selectedDate;
  final TimeSlotModel timeSlot;
  final String status;

  AppointmentModel(
    this.id,
    this.userId,
    this.service,
    this.selectedDate,
    this.timeSlot,
    this.status,
  );

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'userId': userId,
      'service': service.toJson(),
      'selectedDate': selectedDate,
      'timeSlot': timeSlot.toJson(),
      'status': status,
    };
  }

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      json['_id'],
      json['userId'],
      ServiceModel.fromJson(json['service']),
      DateTime.parse(json['selectedDate']),
      TimeSlotModel.fromJson(json['timeSlot']),
      json['status'],
    );
  }

  Appointment toEntity() {
    return Appointment(
      uid: id,
      userId: userId,
      service: service.toEntity(),
      selectedDate: selectedDate,
      timeSlot: timeSlot.toEntity(),
      status: status,
    );
  }
}
