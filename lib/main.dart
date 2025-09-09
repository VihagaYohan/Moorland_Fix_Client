import 'package:flutter/material.dart';
import 'package:moorland_fix/app/routes/app_navigator.dart';

// pages
import 'package:moorland_fix/app/features/index.dart';

// theme
import 'package:moorland_fix/app/theme/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Moorland Fix",
      theme: lightTheme,
      darkTheme: darkTheme,
      routes: AppNavigator.routes,
      home: const HomePage()
    );
  }
}
