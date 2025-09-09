import 'package:flutter/material.dart';

// widgets
import 'package:moorland_fix/app/shared/index.dart';

// layouts
import './layouts/index.dart';

class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({super.key});

  @override
  State<AppointmentsPage> createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  @override
  Widget build(BuildContext context) {
    return UIResponsiveLayout(
      compactLayout: CompactLayout(),
      mediumLayout: MediumLayout(),
      expandedLayout: ExpandedLayout(),
    );
  }
}
