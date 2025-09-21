abstract class AppointmentException implements Exception {
  final String message;

  AppointmentException(this.message);
}

class EmptyListException extends AppointmentException {
  EmptyListException(super.message);
}