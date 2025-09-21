// repository
import '../repositories/appointment_repository.dart';
// shared
import 'package:moorland_fix/app/shared/index.dart';
// entities
import '../entities/_index.dart';

class AllServices {
  final AppointmentRepository _repository;

  AllServices(this._repository);

  Future<Result<List<Services>>> initiate() async {
    return _repository.allServices();
  }
}