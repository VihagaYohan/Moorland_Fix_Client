import 'package:flutter/material.dart';
// domain entities
import 'package:moorland_fix/app/features/appointments/domain/entities/_index.dart';
// widgets
import 'package:moorland_fix/app/features/appointments/presentation/widgets/_index.dart';
// shared
import 'package:moorland_fix/app/shared/index.dart';

class AppointmentCard extends StatelessWidget {
  final Appointment appointment;

  const AppointmentCard({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditAppointment(appointment: appointment),
            ),
          ),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(Constants.spaceSmall),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  itemRow(
                    "Date",
                    AppFormatter.formatDateWithMonth(appointment.selectedDate),
                    context,
                  ),
                  itemRow(
                    "Time",
                    "${appointment.timeSlot.startTime} - ${appointment.timeSlot.endTime}",
                    context,
                  ),
                ],
              ),

              const SizedBox(height: Constants.spaceMedium),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  itemRow("Service", appointment.service.name, context),
                ],
              ),

              const SizedBox(height: Constants.spaceSmall),

              Row(
                children: <Widget>[
                  Text(
                    "Status",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(width: Constants.spaceSmall),
                  Text(
                    appointment.status.toUpperCase(),
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      color:
                          appointment.status == Constants.booked
                              ? Colors.green
                              : Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget itemRow(String title, String value, BuildContext context) {
    return Row(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400),
            ),
            Text(
              value,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
