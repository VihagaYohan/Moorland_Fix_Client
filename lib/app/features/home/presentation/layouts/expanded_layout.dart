import 'package:flutter/material.dart';
// shared
import 'package:moorland_fix/app/shared/index.dart';
// theme
import 'package:moorland_fix/app/theme/index.dart';

// pages
import '../../../appointments/presentation/root_appointments_page.dart';
import '../../../profile/presentation/root_profile_page.dart';

class ExpandedLayout extends StatefulWidget {
  const ExpandedLayout({super.key});

  @override
  State<ExpandedLayout> createState() => _ExpandedLayoutState();
}

class _ExpandedLayoutState extends State<ExpandedLayout> {
  int currentPageIndex = 0;
  final bool showNavigationDrawer = true;

  void handleScreenChanged(int selectedScreen) {
    setState(() {
      currentPageIndex = selectedScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          drawerNavigation(),
          // const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: Scaffold(
              body: [AppointmentsPage(), ProfilePage()][currentPageIndex],
            ),
          ),
        ],
      ),
    );
  }

  Widget drawerNavigation() {
    return NavigationDrawer(
      selectedIndex: currentPageIndex,
      onDestinationSelected: (int index) {
        setState(() {
          currentPageIndex = index;
        });
      },
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(Constants.spaceMedium),
          child: DrawerHeader(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.transparent)),
            ),
            child: Center(
              child: Text(
                "Moorland Fix",
                style: Theme.of(
                  context,
                ).textTheme.displayLarge!.copyWith(color: AppColors.primary),
              ),
            ),
          ),
        ),

        const SizedBox(height: Constants.spaceLarge),

        NavigationDrawerDestination(
          icon: Icon(Icons.calendar_month_outlined, color: Colors.grey),
          label: Text("Appointments"),
          selectedIcon: Icon(Icons.calendar_month, color: AppColors.primary),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.man_outlined, color: Colors.grey),
          label: Text("Profile"),
          selectedIcon: Icon(Icons.man, color: AppColors.primary),
        ),
      ],
    );
  }
}
