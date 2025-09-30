import 'package:flutter/material.dart';
// domain entities
import 'package:moorland_fix/app/features/appointments/domain/entities/_index.dart';
// provider
import 'package:moorland_fix/app/features/appointments/presentation/provider/appointments_provider.dart';
// shared
import 'package:moorland_fix/app/shared/index.dart';
import 'package:provider/provider.dart';

class EditAppointment extends StatefulWidget {
  final Appointment appointment;
  final bool? isCompleted;

  EditAppointment({
    super.key,
    required this.appointment,
    required this.isCompleted,
  });

  // controllers
  final TextEditingController notesController = TextEditingController();

  // states
  late StatusList? selectedStatus;

  @override
  State<EditAppointment> createState() => _EditAppointmentState();
}

class _EditAppointmentState extends State<EditAppointment> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.notesController.text = widget.appointment.notes ?? "";
  }

  void showAlert(String title, String message, Function() onPressed) {
    DeviceUtils.showAlertDialog(context, title, message, "OK", onPressed());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Appointment Details",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: Constants.spaceMedium,
          horizontal: Constants.spaceSmall,
        ),
        child: Consumer<AppointmentProvider>(
          builder: (context, appointmentProvider, _) {
            if (appointmentProvider.isLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (appointmentProvider.isError) {
              if (appointmentProvider.getError != null) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  showAlert(
                    "Alert",
                    appointmentProvider.getError!.toString().replaceFirst(
                      "Exception: ",
                      "",
                    ),
                    () {
                      appointmentProvider.resetState();
                    },
                  );
                });
              }
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                itemRow(
                  "Date",
                  AppFormatter.formatDateWithMonth(
                    widget.appointment.selectedDate,
                  ),
                  context,
                ),
                itemRow(
                  "Time slot",
                  "${widget.appointment.timeSlot.startTime} - ${widget.appointment.timeSlot.endTime}",
                  context,
                ),
                itemRow(
                  "Current status",
                  widget.appointment.status,
                  context,
                  widget.appointment.status == Constants.booked
                      ? Colors.green
                      : Colors.red,
                ),

                const SizedBox(height: Constants.spaceMedium),

                // divider
                Divider(
                  height: Constants.spaceSmall / 2,
                  color: Theme.of(context).colorScheme.primary,
                ),

                const SizedBox(height: Constants.spaceMedium),

                // notes
                UiInputField(
                  controller: widget.notesController,
                  labelText: "Notes",
                  hintText: "Add any special notes here",
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  readOnly: widget.isCompleted == true ? true : false,
                ),

                const SizedBox(height: Constants.spaceMedium),

                // services
                if (widget.isCompleted == false)
                  UIDropDown(
                    items: Constants.statusList,
                    hintText: "Select a status",
                    onChanged: (String? selectedId) {
                      setState(() {
                        widget.selectedStatus = Constants.statusList.firstWhere(
                          (service) => service.uid == selectedId,
                        );
                      });
                    },
                    itemText: (item) => item.name,
                    itemValue: (item) => item.uid,
                    validator: (value) {
                      if (value == null) {
                        return "Please select a service";
                      }
                      return null;
                    },
                    isDisabled: false,
                  ),

                if (widget.isCompleted == false)
                  UIFilledButton(
                    label: "Save",
                    onPressed: () async {
                      // update appointment
                      Appointment payload = Appointment(
                        uid: widget.appointment.uid,
                        userId: widget.appointment.userId,
                        service: widget.appointment.service,
                        selectedDate: widget.appointment.selectedDate,
                        notes: widget.notesController.text,
                        timeSlot: widget.appointment.timeSlot,
                        status: widget.selectedStatus!.name,
                      );

                      appointmentProvider.updateAppointmentBooking(payload);

                      // show success message
                      showAlert(
                        "Success",
                        "Appointment updated successfully",
                        () {
                          Navigator.pop(context);
                        },
                      );
                    },
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget itemRow(
    String title,
    String value,
    BuildContext context, [
    Color? color,
  ]) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400),
        ),

        const SizedBox(height: Constants.spaceSmall),

        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.bold,
            color: color ?? Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
