// datasource
import 'package:moorland_fix/app/features/appointments/data/data_sources/appointment_remote_impl.dart';

// domain
import 'package:moorland_fix/app/features/appointments/domain/entities/service_entity.dart';
import 'package:moorland_fix/app/features/appointments/domain/repositories/appointment_repository.dart';

// shared
import 'package:moorland_fix/app/shared/result.dart';

class AppointmentRepositoryImpl implements AppointmentRepository {
  final AppointmentRemoteImpl dataSource;

  AppointmentRepositoryImpl(this.dataSource);

  @override
  Future<Result<List<Services>>> allServices() {
    // TODO: implement allServices
    throw UnimplementedError();
  }
}