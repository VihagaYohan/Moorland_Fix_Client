import 'package:moorland_fix/app/shared/index.dart';
import '../entities/_index.dart';

abstract class AppointmentRepository {
  Future<Result<List<Services>>> allServices();
}