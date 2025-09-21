import 'package:cloud_firestore/cloud_firestore.dart';
// shared
import 'package:moorland_fix/app/shared/index.dart';

// exceptions
import '../../data/exceptions/appointment_exceptions.dart';
// models
import '../models/services_model.dart';

class AppointmentRemoteImpl {
  FirebaseFirestore dbInstance;

  AppointmentRemoteImpl(this.dbInstance);

  Future<Result<List<ServiceModel>>> getAllServices() async {
    try {
      final List<ServiceModel> servicesList = [];
      final snapshot = await dbInstance.collection(Collections.services).get();
      if(snapshot.docs.isEmpty) {
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
}
