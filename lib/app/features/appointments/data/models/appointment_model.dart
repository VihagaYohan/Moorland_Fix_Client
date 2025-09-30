// domain entities
// data models
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moorland_fix/app/features/appointments/data/models/_index.dart';
import 'package:moorland_fix/app/features/appointments/domain/entities/_index.dart';

class AppointmentModel {
  final String id;
  final String userId;
  final ServiceModel service;
  final DateTime selectedDate;
  final TimeSlotModel timeSlot;
  final String notes;
  final String status;

  AppointmentModel(
    this.id,
    this.userId,
    this.service,
    this.selectedDate,
    this.timeSlot,
    this.notes,
    this.status,
  );

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'userId': userId,
      'service': service.toJson(),
      'selectedDate': Timestamp.fromDate(selectedDate),
      'timeSlot': timeSlot.toJson(),
      'notes': notes,
      'status': status,
    };
  }

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    final ts = json['selectedDate'];
    return AppointmentModel(
      json['_id'],
      json['userId'],
      ServiceModel.fromJson(json['service']),
      ts is Timestamp
          ? ts.toDate()
          : (ts is String ? DateTime.parse(ts) : DateTime.now()),
      TimeSlotModel.fromJson(json['timeSlot']),
      json['notes'],
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
      notes: notes,
      status: status,
    );
  }
}
