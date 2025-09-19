class TimeSlot {
  final String _id;
  final String startTime;
  final String endTime;
  final String period;

  TimeSlot(this._id, this.startTime, this.endTime, this.period);

  @override
  String toString() {
    return "$_id - $startTime - $endTime ($period)";
  }
}
