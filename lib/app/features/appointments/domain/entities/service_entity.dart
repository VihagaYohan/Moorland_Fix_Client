

import 'package:moorland_fix/app/features/appointments/data/models/_index.dart';

class Services {
  String uid;
  String name;
  int slotsPerDay;
  bool wholeDayBooking;
  String description;

  Services({
    required this.uid,
    required this.name,
    required this.slotsPerDay,
    required this.wholeDayBooking,
    required this.description,
  });

  ServiceModel toModel()  {
    return ServiceModel(uid, name, slotsPerDay, wholeDayBooking, description);
  }
}
