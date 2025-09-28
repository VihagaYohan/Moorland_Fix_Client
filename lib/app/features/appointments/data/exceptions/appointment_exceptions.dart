abstract class AppointmentException implements Exception {
  final String message;

  AppointmentException(this.message);
}

class EmptyListException extends AppointmentException {
  @override
  final String message;
  EmptyListException(this.message): super(message);

  @override
  String toString() => message;
}

class AllSlotsBookedException extends AppointmentException {
  @override
  final String message;
  AllSlotsBookedException(this.message) : super(message);

  @override
  String toString() => message;
}

class PaintingBookingNotAllowdException extends AppointmentException {
  PaintingBookingNotAllowdException(super.message);
}