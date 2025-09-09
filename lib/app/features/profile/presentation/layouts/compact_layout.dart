import 'package:flutter/material.dart';

// theme
import 'package:moorland_fix/app/theme/index.dart';

// shared
import 'package:moorland_fix/app/shared/index.dart';

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
      body: Center(
        child: Text('profile page')
      ),
    );
  }
}
