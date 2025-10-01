import 'package:flutter/material.dart';

// widgets
import 'package:moorland_fix/app/shared/index.dart';

// layouts
import './layouts/index.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return UIResponsiveLayout(
      compactLayout: CompactLayout(),
      mediumLayout: CompactLayout(),
      expandedLayout: CompactLayout(),
    );
  }
}
