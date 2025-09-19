import 'package:flutter/material.dart';
// shared
import 'package:moorland_fix/app/shared/index.dart';

class TimeSlot {
  final String startTime;
  final String endTime;
  final String period;
  final String id;

  TimeSlot(this.startTime, this.endTime, this.period, this.id);

  // Optional: Add a toString method for better display
  @override
  String toString() {
    return '$startTime - $endTime ($period)';
  }
}

class Services {
  final String _id;
  final String name;
  final int slotsPerDay;
  final bool wholeDayBooking;
  final String description;
  List<TimeSlot>? timeSlots;

  Services(
    this._id,
    this.name,
    this.slotsPerDay,
    this.wholeDayBooking,
    this.description, {
    this.timeSlots,
  }) {
    if (wholeDayBooking == false) {
      timeSlots = commonTimeSlots;
    } else {
      timeSlots = wholeDaySlot;
    }
  }

  static final List<TimeSlot> commonTimeSlots = [
    TimeSlot("08:00", "11:00", "morning", "1"),
    TimeSlot("11:00", "14:00", "afternoon", "2"),
    TimeSlot("14:00", "17:00", "evening", "3"),
  ];

  static final List<TimeSlot> wholeDaySlot = [
    TimeSlot("08:00", "05:00", "whole day", "1"),
  ];
}

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

  // controllers
  final TextEditingController notesController = TextEditingController(text: "");
  final TextEditingController dateController = TextEditingController(text: "");

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
    TimeSlot("08:00", "11:00", "morning", "1"),
    TimeSlot("11:00", "14:00", 'afternoon', "2"),
    TimeSlot("14:00", "17:00", 'evening', "3"),
  ];

  final List<TimeSlot> availableTimeSlots = [
    TimeSlot("08:00", "11:00", "morning", "1"),
  ];

  final List<Services> services = [
    Services(
      "1",
      "Electrical",
      4,
      false,
      "Wiring, outlet installation, lighting, electrical repair",
    ),
    Services(
      "2",
      "General Handyman",
      4,
      false,
      "Various home repairs and maintenance tasks",
    ),
    Services(
      "3",
      "Gardening",
      3,
      false,
      "Lawn care, planting, landscaping, tree trimming",
    ),
    Services("4", "Painting", 1, true, "Interior and exterior painting"),
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
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: Constants.spaceLarge),

                      // services
                      UIDropDown(
                        items: services,
                        hintText: "Select a service",
                        onChanged: (String? selectedId) {
                          print('selected ID : $selectedId');
                        },
                        itemText: (item) => item.name,
                        itemValue: (item) => item._id,
                        validator: (value) {
                          if (value == null) return "Please select a service";
                          return null;
                        },
                      ),

                      SizedBox(height: Constants.spaceSmall),

                      // appointment date picker
                      UIDatePicker(
                        controller: dateController,
                        hintText: "Select a date",
                        value: (value) => "",
                        validator: (value) {
                          if (value == null) return "Please select a date";
                        },
                      ),

                      SizedBox(height: Constants.spaceSmall),

                      // available time slots
                      UIDropDown(
                        items: commonTimeSlot,
                        hintText: "Select a time slot",
                        onChanged: (String? selectedId) {
                          print('selected ID : $selectedId');
                        },
                        itemText:
                            (item) =>
                                '${item.startTime} - ${item.endTime} - ${item.period}',
                        itemValue: (item) => item.id,
                        validator: (value) {
                          if (value == null) return "Please select a time slot";
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
                          DeviceUtils.getDatePicker(context);
                        },
                        label: "Reserve",
                        width: double.infinity,
                      ),
                    ],
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
