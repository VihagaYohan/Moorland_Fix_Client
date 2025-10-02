import 'package:flutter/material.dart';

// widgets
import 'package:moorland_fix/app/features/appointments/presentation/widgets/_index.dart';
import 'package:moorland_fix/app/features/appointments/presentation/widgets/compact/compact_completed_layout.dart';

// shared
import 'package:moorland_fix/app/shared/index.dart';

class AppointmentList extends StatefulWidget {
  const AppointmentList({super.key});

  @override
  State<AppointmentList> createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 4,
    child: Scaffold(
      appBar: AppBar(
        bottom: const TabBar(
          tabs: [
            Tab(icon: Icon(Icons.pending), text: "Pending"),
            Tab(icon: Icon(Icons.schedule), text: "Upcoming"),
            Tab(icon: Icon(Icons.verified), text: "Completed"),
            Tab(icon: Icon(Icons.cancel), text: "Cancelled")
          ],
        )
      ),
      body:  TabBarView(
        children: [
          Center(child: CompactUpcomingLayout(status: Constants.statusList[3].name)),
          Center(child: CompactUpcomingLayout(status: Constants.statusList[0].name)),
          Center(child: CompactCompletedLayout(status: Constants.statusList[1].name)),
          Center(child: CompactCompletedLayout(status: Constants.statusList[2].name)),
        ],
      )
    ));
  }
}
