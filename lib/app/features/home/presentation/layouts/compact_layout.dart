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
        selectedIndex: currentPageIndex,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        indicatorColor: Colors.transparent,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        destinations:  <Widget>[
          NavigationDestination(
            icon: Icon(Icons.calendar_month_outlined, color: Colors.grey),
            label: "Appointments",
            selectedIcon: Icon(Icons.calendar_month, color: AppColors.primary,),
          ),

          NavigationDestination(
            icon: Icon(Icons.man_2_outlined, color: Colors.grey),
            label: "Profile",
            selectedIcon: Icon(Icons.man, color: AppColors.primary),
          ),
        ],
      ),
      body: const [AppointmentsPage(), ProfilePage()][currentPageIndex],
    );
  }
}
