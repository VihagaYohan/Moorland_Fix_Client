import 'package:flutter/material.dart';

// widgets
import 'package:moorland_fix/app/features/appointments/presentation/widgets/_index.dart';
import 'package:moorland_fix/app/features/appointments/presentation/widgets/compact/compact_completed_layout.dart';

class AppointmentList extends StatefulWidget {
  const AppointmentList({super.key});

  @override
  State<AppointmentList> createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2,
    child: Scaffold(
      appBar: AppBar(
        bottom: const TabBar(
          tabs: [
            Tab(icon: Icon(Icons.schedule), text: "Upcoming"),
            Tab(icon: Icon(Icons.verified), text: "Completed")
          ],
        )
      ),
      body: const TabBarView(
        children: [
          Center(child: CompactUpcomingLayout()),
          Center(child: CompactCompletedLayout())
        ],
      )
    ));
  }
}
