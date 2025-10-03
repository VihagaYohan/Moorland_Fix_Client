import 'package:flutter/material.dart';
import 'package:moorland_fix/app/features/appointments/presentation/widgets/_index.dart';
import 'package:moorland_fix/app/features/appointments/presentation/widgets/new_appointment.dart';

// flavors
import 'package:moorland_fix/app/flavors/flavor_config.dart';

import '../../../../shared/constants.dart';

class CompactLayout extends StatefulWidget {
  const CompactLayout({super.key});

  @override
  State<CompactLayout> createState() => _CompactLayoutState();
}

class _CompactLayoutState extends State<CompactLayout> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppointmentList(),
      /*      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return NewAppointment();
            },
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Book an appointment"),
            Icon(Icons.add)
          ]
        ),
      ),*/
      floatingActionButton: BookAppointment(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewAppointment()),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class BookAppointment extends FloatingActionButton {
  const BookAppointment({super.key, required super.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Constants.spaceSmall),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(Constants.spaceSmall),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: Constants.spaceSmall,
            horizontal: Constants.spaceMedium,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.add, color: Colors.white),
              const SizedBox(width: Constants.spaceSmall),
              Text(
                "Book An Appointment",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
