import 'package:flutter/material.dart';

class ExpandedLayout extends StatefulWidget {
  const ExpandedLayout({super.key});

  @override
  State<ExpandedLayout> createState() => _ExpandedLayoutState();
}

class _ExpandedLayoutState extends State<ExpandedLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text('login page')
      ),
    );
  }
}
