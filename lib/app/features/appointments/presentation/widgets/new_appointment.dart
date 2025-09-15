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

class NewAppointment extends StatefulWidget {
  const NewAppointment({super.key});

  @override
  State<NewAppointment> createState() => _NewAppointmentState();
}

class _NewAppointmentState extends State<NewAppointment> {
  final _formKey = GlobalKey<FormState>();

  // controllers
  final TextEditingController notesController = TextEditingController(text: "");

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
                      // form fields container
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

                      SizedBox(height: Constants.spaceSmall),

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
                          if(value == null) return "Please select a time slot";
                          return null;
                        },
                      ),

                      /*                      UIDropDown(
                        timeSlots: commonTimeSlot,
                        hintText: 'Choose a time slot',
                        onChanged: (String? selectedId) {
                          if (selectedId != null) {
                            // Find the complete TimeSlot object if needed
                            TimeSlot? selectedSlot = commonTimeSlot.firstWhere(
                                  (slot) => slot.id == selectedId,
                              orElse: () => TimeSlot("", "", "", ""),
                            );

                            print('Selected ID: $selectedId');
                            print('Full details: ${selectedSlot.period} (${selectedSlot.startTime} - ${selectedSlot.endTime})');
                          }
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'Please select a time slot';
                          }
                          return null;
                        },),*/
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
