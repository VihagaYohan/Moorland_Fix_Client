// datasource
import 'package:moorland_fix/app/features/appointments/data/data_sources/appointment_remote_impl.dart';
// domain
import 'package:moorland_fix/app/features/appointments/domain/entities/_index.dart';
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

  @override
  Future<Result<void>> reserveAppointment(AppointmentRequest payload) async {
    // TODO: implement reserveAppointment
    Result result = await dataSource.bookService(payload);
    return result;
  }

  @override
  Future<Result<List<TimeSlot>>> getBookingDates(DateTime date) async {
    // TODO: implement getBookingDates
    List<TimeSlot> timeSlotList = [];
    Result<List<TimeSlotModel>> result = await dataSource.getAvailableTimeSlots(date);
    if(result.isSuccess && result.data != null) {
      for(var slot in result.data!) {
        timeSlotList.add(slot.toEntity());
      }
    }
    return Result.success(timeSlotList);
  }
}
