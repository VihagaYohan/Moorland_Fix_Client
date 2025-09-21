// datasource
import 'package:moorland_fix/app/features/appointments/data/data_sources/appointment_remote_impl.dart';
// domain
import 'package:moorland_fix/app/features/appointments/domain/entities/service_entity.dart';
import 'package:moorland_fix/app/features/appointments/domain/repositories/appointment_repository.dart';
// shared
import 'package:moorland_fix/app/shared/result.dart';

// model
import '../models/_index.dart';

class AppointmentRepositoryImpl implements AppointmentRepository {
  final AppointmentRemoteImpl dataSource;

  AppointmentRepositoryImpl(this.dataSource);

  @override
  Future<Result<List<Services>>> allServices() async {
    // TODO: implement allServices
    List<Services> servicesList = [];
    Result<List<ServiceModel>> result = await dataSource.getAllServices();
    if (result.isSuccess && result.data != null) {
      for(var service in result.data!){
        servicesList.add(service.toEntity());
      }
    }
    return Result.success(servicesList);
  }
}
