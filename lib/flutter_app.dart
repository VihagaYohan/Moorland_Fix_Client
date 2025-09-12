import 'package:flutter/material.dart';

// routes
import 'package:moorland_fix/app/routes/app_navigator.dart';

// pages
import 'package:moorland_fix/app/features/index.dart';

// theme
import 'package:moorland_fix/app/theme/index.dart';

class MoorlandApp extends StatelessWidget {
  const MoorlandApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Moorland Fix",
        theme: lightTheme,
        darkTheme: darkTheme,
        routes: AppNavigator.routes,
        home: const LoginPage()
    );
  }
}
