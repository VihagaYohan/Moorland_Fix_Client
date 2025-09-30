import '../../data/models/time_slot_model.dart';

class TimeSlot {
  final String uid;
  final String startTime;
  final String endTime;
  final String period;

  TimeSlot(this.uid, this.startTime, this.endTime, this.period);

  @override
  String toString() {
    return "$startTime - $endTime ($period)";
  }

  TimeSlotModel toModel() {
    return TimeSlotModel(uid, startTime, endTime, period);
  }
}
