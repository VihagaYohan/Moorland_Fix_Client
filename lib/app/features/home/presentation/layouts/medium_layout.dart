import 'package:flutter/material.dart';
import 'package:moorland_fix/app/features/appointments/presentation/root_appointments_page.dart';
import 'package:moorland_fix/app/features/profile/presentation/root_profile_page.dart';

class MediumLayout extends StatefulWidget {
  const MediumLayout({super.key});

  @override
  State<MediumLayout> createState() => _MediumLayoutState();
}

class _MediumLayoutState extends State<MediumLayout> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          // navigation rail
          NavigationRail(
            selectedIndex: currentPageIndex,
            labelType: NavigationRailLabelType.all,
            indicatorColor: Colors.transparent,
            elevation: 5,
            onDestinationSelected: (int index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            destinations: [
              NavigationRailDestination(
                icon: Icon(Icons.calendar_month_outlined),
                label: Text("Appointments"),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.man_2_outlined),
                label: Text("Profile"),
              ),
            ],
          ),

          //const VerticalDivider(thickness: 1, width: 1),

          Expanded(
            child: const [AppointmentsPage(), ProfilePage()][currentPageIndex],
          ),
        ],
      ),
    );
  }
}
