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
  late String? date;
  late String? timeSlotId;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  UserEntity? currentUser;

  // controllers
  final TextEditingController notesController = TextEditingController(text: "note");
  final TextEditingController dateController = TextEditingController(text: "");

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

  void showAlert() {
    DeviceUtils.showAlertDialog(
      context,
      "Reservation Completed",
      "You've successfully reserved a slot for ${notesController.text} on ${DateTime.now().toString()}",
      "OK",
      () {},
    );
  }

  final List<TimeSlot> commonTimeSlot = [
    TimeSlot("3CXSz5ZE4ggdNozLKdSM","08:00", "11:00", "morning"),
    //TimeSlot("11:00", "14:00", 'afternoon', "2"),
    //TimeSlot("14:00", "17:00", 'evening', "3"),
  ];

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
          Text(
            "Reserve a date and a time slot",
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
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
                        return const Center(child: CircularProgressIndicator());
                      } else if (appointmentProvider.isError) {
                        return Center(
                          child: Text(appointmentProvider.getError.toString()),
                        );
                      }
                      return Column(
                        children: <Widget>[
                          SizedBox(height: Constants.spaceLarge),

                          // services
                          UIDropDown(
                            items: appointmentProvider.services,
                            hintText: "Select a service",
                            onChanged: (String? selectedId) {
                              setState(() {
                                serviceId = selectedId;
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
                          ),

                          SizedBox(height: Constants.spaceSmall),

                          // appointment date picker
                          /*                          UIDatePicker(
                            controller: dateController,
                            hintText: "Select a date",
                            value: (value) => "",
                            validator: (value) {
                              if (value == null) return "Please select a date";
                            },
                          ),*/
                          TableCalendar(
                            firstDay: DateTime.utc(2010, 10, 16),
                            lastDay: DateTime.utc(2030, 3, 14),
                            focusedDay: DateTime.now(),
                            selectedDayPredicate: (day) {
                              return isSameDay(_selectedDay, day);
                            },
                            onDaySelected: (selectedDay, focusedDay) {
                              setState(() {
                                _selectedDay = selectedDay;
                                _focusedDay =
                                    focusedDay; // update `_focusedDay` here as well
                              });
                            },
                            calendarBuilders: CalendarBuilders(),
                          ),

                          SizedBox(height: Constants.spaceSmall),

                          // available time slots
                          UIDropDown(
                            items: commonTimeSlot,
                            hintText: "Select a time slot",
                            onChanged: (String? selectedId) {
                              setState(() {
                                timeSlotId = selectedId;
                              });
                            },
                            itemText:
                                (item) =>
                                    '${item.startTime} - ${item.endTime} - ${item.period}',
                            itemValue: (item) =>  item.uid,
                            validator: (value) {
                              if (value == null)
                                return "Please select a time slot";
                              return null;
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
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter a note";
                              }
                            },
                          ),

                          SizedBox(height: Constants.spaceLarge * 2),

                          UIFilledButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                /// reserve appointment
                                AppointmentRequest payload = AppointmentRequest(
                                  userId: currentUser!.uid,
                                  service: appointmentProvider.services[0],
                                  selectedDate: _selectedDay!,
                                  timeSlot: TimeSlot(
                                    "3CXSz5ZE4ggdNozLKdSM",
                                    "'08:00",
                                    "11:00",
                                    "morning",
                                  ),
                                  status: "Booked",
                                );
                                appointmentProvider.reserveAppointment(payload);
                              }
                            },
                            label: "Reserve",
                            width: double.infinity,
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
