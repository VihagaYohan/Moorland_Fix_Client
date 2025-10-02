import 'package:flutter/material.dart';
import 'package:moorland_fix/app/features/appointments/domain/entities/_index.dart';
// usecases
import 'package:moorland_fix/app/features/appointments/domain/usecases/_index.dart';

class AppointmentProvider extends ChangeNotifier {
  final AllServices allServices;
  final AddBooking addBooking;
  final GetBookingDates getBookingDates;
  final AllAppointments allAppointments;
  final UpdateBooking updateAppointment;

  AppointmentProvider({
    required this.allServices,
    required this.addBooking,
    required this.getBookingDates,
    required this.allAppointments,
    required this.updateAppointment
  });

  // loading
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  // services
  List<Services> _services = [];

  List<Services> get services => _services;

  // available time slots
  List<TimeSlot> _availableTimeSlots = [];

  List<TimeSlot> get availableTimeSlots => _availableTimeSlots;

  // appointments
  List<Appointment> _appointments = [];
  List<Appointment> get appointments => _appointments;

  // error
  Exception? _error = null;

  Exception? get getError => _error;

  // isError
  bool _isError = false;

  bool get isError => _isError;

  // message
  String? _message = null;
  String? get message => _message;

  // get all services
  Future<void> getServices() async {
    _isLoading = true;

    final result = await allServices.initiate();
    if (result.isSuccess && result.data != null) {
      _services = result.data!;
    } else if (result.isSuccess && result.data!.isEmpty) {
      _isError = true;
      _error = Exception("No services found");
    } else {
      _isError = true;
      _error = result.error;
    }

    _isLoading = false;
    notifyListeners();
  }

  // add booking
  Future<void> reserveAppointment(AppointmentRequest payload) async {
    _isLoading = true;

    if (payload.service.name == "Painting" && payload.timeSlot != "whole-day") {
      _isError = true;
      _error = Exception("Painting service cannot be booked during the day");
      notifyListeners();
      return;
    }

    final result = await addBooking.initiate(payload);
    if (result.isSuccess) {
      final message = result.data;
    } else {
      _isError = true;
      _error = result.error;
    }
    _isLoading = false;
    notifyListeners();
  }

  // update booking
  Future<void> updateAppointmentBooking(Appointment payload) async {
    _isLoading = true;

    final result = await updateAppointment.initiate(payload);
    if(result.isSuccess) {
        _message = "Appointment updated";
    } else {
      _isError = true;
      _error = result.error;
    }

    _isLoading = false;
    notifyListeners();
  }

  // fetch available time slots for the selected date
  Future<void> fetchAvailableTimeSlots(DateTime date) async {
    _isLoading = true;

    final result = await getBookingDates.initiate(date);
    if(result.isSuccess && result.data != null && result.data!.isNotEmpty) {
      _availableTimeSlots = result.data!;
    } else {
      _isError = true;
      _error = result.error;
    }

    _isLoading = false;
    notifyListeners();
  }

  // fetch all appointments
  Future<void> fetchAllAppointments(String userId, String status, [bool isAdmin = false]) async {
    _isLoading = true;

    final result = await allAppointments.initiate(userId, status, isAdmin);
    if(result.isSuccess && result.data != null) {
      _appointments = result.data!;
    } else if(result.isSuccess && result.data!.isEmpty) {
      _isError = true;
      _error = Exception("No appointments found");
    } else {
      _isError = true;
      _error = result.error;
    }

    _isLoading = false;
    notifyListeners();
  }


  void resetState() {
    _isError = false;
    _error = null;
    notifyListeners();
  }
}
