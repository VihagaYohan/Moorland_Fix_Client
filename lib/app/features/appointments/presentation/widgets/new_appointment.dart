import 'package:flutter/material.dart';
import 'package:moorland_fix/app/features/appointments/domain/entities/_index.dart';
// provider
import 'package:moorland_fix/app/features/appointments/presentation/provider/appointments_provider.dart';
// user entity domain
import 'package:moorland_fix/app/features/auth/domain/entities/_index.dart';
// shared
import 'package:moorland_fix/app/shared/index.dart';
import 'package:moorland_fix/app/shared/services/index.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class NewAppointment extends StatefulWidget {
  const NewAppointment({super.key});

  @override
  State<NewAppointment> createState() => _NewAppointmentState();
}

class _NewAppointmentState extends State<NewAppointment> {
  // form key
  final _formKey = GlobalKey<FormState>();

  // states
  late List<TimeSlot> _availableSlots;
  late String? serviceId;
  late Services? selectedService;
  late TimeSlot? selectedTimeSlot;
  late String? date;
  late String? timeSlotId;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  UserEntity? currentUser;
  bool showForm = false;

  // controllers
  final TextEditingController notesController = TextEditingController(text: "");
  final TextEditingController dateController = TextEditingController(text: "");
  final TextEditingController postCodeController = TextEditingController(
    text: "",
  );
  final TextEditingController contactNumberController = TextEditingController(
    text: "",
  );

  @override
  void initState() {
    super.initState();
    getUserProfile();

    Future.microtask(() {
      Provider.of<AppointmentProvider>(context, listen: false).getServices();
    });
  }

  void getUserProfile() async {
    final userProfile = UserProfile();
    UserEntity? userEntity = await userProfile.getUserProfile();
    setState(() {
      currentUser = userEntity;
    });
  }

  void showAlert(String title, String message, Function() onPressed) {
    DeviceUtils.showAlertDialog(context, title, message, "OK", onPressed());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Constants.spaceMedium,
        vertical: Constants.spaceLarge,
      ),
      child: Column(
        children: [
          // title
          Center(
            child: Text(
              "Reserve an appointment",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          // form container
          Expanded(
            child: ListView(
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Consumer<AppointmentProvider>(
                    builder: (context, appointmentProvider, _) {
                      if (appointmentProvider.isLoading) {
                        return SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else if (appointmentProvider.isError) {
                        if (appointmentProvider.getError != null) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            setState(() {
                              showForm = false;
                            });
                            showAlert(
                              "Alert",
                              appointmentProvider.getError!
                                  .toString()
                                  .replaceFirst("Exception: ", ""),
                              () {
                                appointmentProvider.resetState();
                              },
                            );
                          });
                        }
                      }
                      return Column(
                        children: <Widget>[
                          SizedBox(height: Constants.spaceLarge),

                          TableCalendar(
                            firstDay: DateTime.utc(2010, 10, 16),
                            lastDay: DateTime.utc(2030, 3, 14),
                            focusedDay: DateTime.now(),
                            selectedDayPredicate: (day) {
                              return isSameDay(_selectedDay, day);
                            },
                            onDaySelected: (selectedDay, focusedDay) async {
                              setState(() {
                                _selectedDay = selectedDay;
                                _focusedDay =
                                    focusedDay; // update `_focusedDay` here as well
                              });

                              // fetch available time slots for the selected date
                              await appointmentProvider.fetchAvailableTimeSlots(
                                selectedDay,
                              );

                              setState(() {
                                showForm =
                                    appointmentProvider
                                            .availableTimeSlots
                                            .isNotEmpty
                                        ? true
                                        : false;
                              });
                            },
                          ),

                          SizedBox(height: Constants.spaceSmall),

                          if (showForm)
                            Column(
                              children: [
                                UIDropDown(
                                  items: appointmentProvider.availableTimeSlots,
                                  hintText: "Select a time slot",
                                  onChanged: (String? selectedId) {
                                    setState(() {
                                      selectedTimeSlot = appointmentProvider
                                          .availableTimeSlots
                                          .firstWhere(
                                            (timeSlot) =>
                                                timeSlot.uid == selectedId,
                                          );
                                    });
                                  },
                                  itemText:
                                      (item) =>
                                          '${item.startTime} - ${item.endTime} - ${item.period}',
                                  itemValue: (item) => item.uid,
                                  validator: (value) {
                                    if (value == null)
                                      return "Please select a time slot";
                                    return null;
                                  },
                                  isDisabled:
                                      appointmentProvider.getError != null
                                          ? true
                                          : false,
                                ),

                                SizedBox(height: Constants.spaceSmall),

                                // services
                                UIDropDown(
                                  items: appointmentProvider.services,
                                  hintText: "Select a service",
                                  onChanged: (String? selectedId) async {
                                    setState(() {
                                      selectedService = appointmentProvider
                                          .services
                                          .firstWhere(
                                            (service) =>
                                                service.uid == selectedId,
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
                                  //isDisabled: selectedTimeSlot != null ? false : true,
                                ),

                                SizedBox(height: Constants.spaceSmall),

                                // postal code
                                UiInputField(
                                  controller: postCodeController,
                                  labelText: "Postal code",
                                  hintText: "Add post code",
                                  keyboardType: TextInputType.none,
                                  textInputAction: TextInputAction.next,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter postal code";
                                    }
                                  },
                                ),

                                SizedBox(height: Constants.spaceSmall),

                                // contact number
                                UiInputField(
                                  controller: contactNumberController,
                                  labelText: "Contact number",
                                  hintText: "Add contact number here",
                                  keyboardType: TextInputType.phone,
                                  textInputAction: TextInputAction.next,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter contact number";
                                    }
                                  },
                                ),

                                SizedBox(height: Constants.spaceSmall),

                                // notes
                                UiInputField(
                                  controller: notesController,
                                  labelText: "Notes",
                                  hintText: "Add any special notes here",
                                  keyboardType: TextInputType.multiline,
                                  textInputAction: TextInputAction.newline,
                                ),

                                SizedBox(height: Constants.spaceLarge * 2),

                                UIFilledButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      // check if the user select whole day for the painting service
                                      if (selectedService!.name == "Painting" &&
                                          selectedTimeSlot!.period !=
                                              "whole-day") {
                                        showAlert(
                                          "Alert",
                                          "Painting service cannot be booked during the day.\nPlease select whole-day time slot or else select a different date.",
                                          () {},
                                        );
                                        return;
                                      }

                                      /// reserve appointment
                                      AppointmentRequest payload =
                                          AppointmentRequest(
                                            userId: currentUser!.uid,
                                            service:
                                                selectedService != null
                                                    ? selectedService!
                                                    : appointmentProvider
                                                        .services
                                                        .first,
                                            selectedDate: _selectedDay!,
                                            timeSlot:
                                                selectedTimeSlot != null
                                                    ? selectedTimeSlot!
                                                    : appointmentProvider
                                                        .availableTimeSlots
                                                        .first,
                                            postCode: postCodeController.text,
                                            contactNumber:
                                                contactNumberController.text,
                                            notes: notesController.text,
                                            status:
                                                Constants.statusList[3].name,
                                          );
                                      appointmentProvider.reserveAppointment(
                                        payload,
                                      );

                                      // show success message
                                      showAlert(
                                        "Success",
                                        "Appointment booked successfully",
                                        () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    }
                                  },
                                  label: "Reserve",
                                  width: double.infinity,
                                ),
                              ],
                            ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
