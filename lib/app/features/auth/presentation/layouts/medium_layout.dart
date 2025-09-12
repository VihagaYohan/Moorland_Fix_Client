import 'package:flutter/material.dart';

class MediumLayout extends StatefulWidget {
  const MediumLayout({super.key});

  @override
  State<MediumLayout> createState() => _MediumLayoutState();
}

class _MediumLayoutState extends State<MediumLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text('login page')
      ),
    );
  }
}
