import 'package:flutter/material.dart';

// widgets
import 'package:moorland_fix/app/shared/index.dart';

// layouts
import './layouts/index.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return UIResponsiveLayout(
      compactLayout: CompactLayout(),
      mediumLayout: MediumLayout(),
      expandedLayout: ExpandedLayout(),
    );
  }
}
