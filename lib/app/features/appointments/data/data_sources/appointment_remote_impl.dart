import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moorland_fix/app/features/appointments/data/models/_index.dart';
import 'package:moorland_fix/app/features/appointments/domain/entities/_index.dart';
// shared
import 'package:moorland_fix/app/shared/index.dart';

// exceptions
import '../../data/exceptions/appointment_exceptions.dart';

class AppointmentRemoteImpl {
  FirebaseFirestore dbInstance;

  AppointmentRemoteImpl(this.dbInstance);

  Future<Result<List<ServiceModel>>> getAllServices() async {
    try {
      final List<ServiceModel> servicesList = [];
      final snapshot = await dbInstance.collection(Collections.services).get();
      if (snapshot.docs.isEmpty) {
        return Result.failure(EmptyListException("No services found"));
      } else {
        for (var doc in snapshot.docs) {
          final service = ServiceModel.fromJson(doc.data());
          servicesList.add(service);
        }
        return Result.success(servicesList);
      }
    } catch (e) {
      return Result.failure(
        Exception("Unknown error at fetching services ${e.toString()}"),
      );
    }
  }

  Future<Result<void>> bookService(AppointmentRequest payload) async {
    try {
      // check if there's a appointment document for the same date
      final snapshot =
          await dbInstance.collection(Collections.appointments).limit(1).get();
      if (snapshot.docs.isEmpty) {
        // create a document
        createAppointment(payload);
      } else {
        // create a document
        createAppointment(payload, hasRecords: true);
      }
      return Result.success("Appointment booked successfully");
    } catch (e) {
      return Result.failure(
        Exception("Unknown error at booking service ${e.toString()}"),
      );
    }
  }

  Future<Result<dynamic>> createAppointment(
    AppointmentRequest payload, {
    bool hasRecords = false,
  }) async {
    try {
      final appointmentRef = dbInstance
          .collection(Collections.appointments)
          .doc(AppFormatter.formatDate(payload.selectedDate));

      if (hasRecords == true) {
        // check if the timeslots are filled for the given date
        final snapshots = await appointmentRef.get();
        if (snapshots.exists) {
          List<dynamic> bookedSlots = snapshots['bookedSlots'];
          if (bookedSlots.length >= 3) {
            Result.failure(
              AllSlotsBookedException(
                "All slots for the ${AppFormatter.formatDate(payload.selectedDate)} has been booked",
              ),
            );
          } else if (bookedSlots.length <= 1 &&
              payload.service.name == "Painting") {
            // not all time slots are booked, but the selected service is painting
            Result.failure(
              PaintingBookingNotAllowdException(
                "Painting service cannot be booked because this day already has other appointments booked on ${AppFormatter.formatDate(payload.selectedDate)}",
              ),
            );
          }
        }
      }

      final appointmentId =
          dbInstance.collection(Collections.appointments).doc().id;

      final appointment = AppointmentModel(
        appointmentId,
        payload.userId,
        payload.service.toModel(),
        payload.selectedDate,
        payload.timeSlot.toModel(),
        payload.status,
      );

      appointmentRef.set({
        "appointments": FieldValue.arrayUnion([appointment.toJson()]),
        "bookedSlots": FieldValue.arrayUnion([appointment.timeSlot.toJson()]),
      }, SetOptions(merge: true));

      return Result.success("Appointment booked successfully");
    } catch (e) {
      return Result.failure(Exception("Unknown error at creating appointment"));
    }
  }

  Future<Result<List<TimeSlotModel>>> getAvailableTimeSlots(
    DateTime payloadDate,
  ) async {
    try {
      final List<TimeSlotModel> availableTimeSlots = [];
      final List<TimeSlotModel> allTimeSlots = [];

      // fetch all default timeslots
      final defaultTimeSlots =
          await dbInstance.collection(Collections.timeSlots).get();
      for (var doc in defaultTimeSlots.docs) {
        allTimeSlots.add(TimeSlotModel.fromJson(doc.data()));
      }

      // check if there's an appointment document for the same date
      final appointmentRootSnapshot =
          await dbInstance
              .collection(Collections.appointments)
              .doc(AppFormatter.formatDate(payloadDate))
              .get();

      if (appointmentRootSnapshot.exists) {
        final bookedSlots = appointmentRootSnapshot['bookedSlots'];

        // check if the timeslots are filled for the given date
        if (bookedSlots.length >= 3) {
          return Result.failure(
            AllSlotsBookedException(
              "All slots are booked for ${AppFormatter.formatDate(payloadDate)}",
            ),
          );
        }
        final Set<String> addedPeriods = {};
        // loop through booked slots and add periods that are already booked to addedPeriods set
        for (var slot in bookedSlots) {
          final bookedSlot = TimeSlotModel.fromJson(slot);
          addedPeriods.add(bookedSlot.period);
        }

        // loop through all time slots and add periods that are not already booked to availableTime slots array
        for (var timeSlot in allTimeSlots) {
          // skip whole-day period
          if (timeSlot.period == "whole-day") {
            continue;
          }
          if (!addedPeriods.contains(timeSlot.period)) {
            availableTimeSlots.add(timeSlot);
          }
        }

        // sort the available time slots
        availableTimeSlots.sort((a, b) => a.startTime.compareTo(b.startTime));

        return Result.success(availableTimeSlots);
      } else {
        // if there's no appointment document for the given date, return all default time slots
        return Result.success(allTimeSlots);
      }
    } catch (e) {
      return Result.failure(
        Exception("Unknown error at fetching available dates"),
      );
    }
  }

  /*  Future<Result<List<AppointmentDocument>>> getBookingDates(
    DateTime payloadDate,
  ) async {
    try {
      final List<AppointmentDocument> appointmentsList = [];
      final appointmentRef = dbInstance.collection(Collections.appointments);

      // start and end date
      final startDate = DateTime(payloadDate.year, payloadDate.month, 1);
      final endDate = DateTime(
        payloadDate.year,
        payloadDate.month + 1,
        0,
      ); // last day of the month

      // format to match with the document id
      final startKey = AppFormatter.formatDate(startDate);
      final endKey = AppFormatter.formatDate(endDate);

      // query documents withing the range
      final snapshot =
          await appointmentRef
              .orderBy(FieldPath.documentId)
              .startAt([startKey])
              .endAt([endKey])
              .get();

      for (var doc in snapshot.docs) {
        final appointmentDocument = AppointmentDocument.fromJson(
          doc.id,
          doc.data(),
        );
        appointmentsList.add(appointmentDocument);
      }
      return Result.success(appointmentsList);
    } catch (e) {
      return Result.failure(
        Exception("Unknown error at fetching booking dates"),
      );
    }
  }*/
}
