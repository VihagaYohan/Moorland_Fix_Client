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
          await dbInstance
              .collection(Collections.appointments)
              .limit(1)
              //.doc(AppFormatter.formatDate(payload.selectedDate))
              .get();
      if (snapshot.docs.isEmpty) {
        // create a document
        final documents = snapshot.docs;
        createAppointment(payload);
      } else {
        // create a document
        createAppointment(payload);
      }
      return Result.success("Appointment booked successfully");
    } catch (e) {
      return Result.failure(
        Exception("Unknown error at booking service ${e.toString()}"),
      );
    }
  }

  void createAppointment(AppointmentRequest payload) {
    final appointmentRef = dbInstance
        .collection(Collections.appointments)
        .doc(AppFormatter.formatDate(payload.selectedDate));

    final appointmentId = dbInstance.collection(Collections.appointments).doc().id;

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
      "bookedSlots": FieldValue.arrayUnion([appointment.timeSlot.toJson()])
    }, SetOptions(merge: true));
  }
}
