import 'package:flutter/material.dart';
import 'package:moorland_fix/app/features/appointments/presentation/widgets/_index.dart';
import 'package:moorland_fix/app/features/appointments/presentation/widgets/new_appointment.dart';
// flavors
import 'package:moorland_fix/app/flavors/flavor_config.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return NewAppointment();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
