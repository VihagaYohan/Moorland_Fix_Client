// domain entities
import 'package:moorland_fix/app/features/appointments/domain/entities/_index.dart';

class TimeSlotModel {
  final String _id;
  final String startTime;
  final String endTime;
  final String period;

  TimeSlotModel(this._id, this.startTime, this.endTime, this.period);

  // toJson
  Map<String,dynamic> toJson() {
    return {
      '_id': _id,
      'startTime': startTime,
      'endTime': endTime,
      'period': period,
    };
  }

  factory TimeSlotModel.fromJson(Map<String, dynamic> json) {
    return TimeSlotModel(
      json['_id'],
      json['startTime'],
      json['endTime'],
      json['period'],
    );
  }

  TimeSlot toEntity() {
    return TimeSlot(_id, startTime, endTime, period);
  }
}
