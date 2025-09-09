import 'package:flutter/material.dart';
import 'package:moorland_fix/app/features/appointments/presentation/root_appointments_page.dart';
import 'package:moorland_fix/app/features/profile/presentation/root_profile_page.dart';
// theme
import 'package:moorland_fix/app/theme/index.dart';

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
      // bottom navigation bar
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        indicatorColor: AppColors.primary,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.calendar_month_outlined),
            label: "Appointment",
            selectedIcon: Icon(Icons.calendar_month),
          ),

          NavigationDestination(
            icon: Icon(Icons.man_2_outlined),
            label: "Profile",
            selectedIcon: Icon(Icons.man),
          ),
        ],
      ),
      body: const [AppointmentsPage(), ProfilePage()][currentPageIndex],
    );
  }
}
