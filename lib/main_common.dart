import 'package:flutter/material.dart';
// pages
import 'package:moorland_fix/app/features/index.dart';
// flavors
import 'package:moorland_fix/app/flavors/flavor_config.dart';
// routes
import 'package:moorland_fix/app/routes/app_navigator.dart';
// theme
import 'package:moorland_fix/app/theme/index.dart';
// app entry point
import 'package:moorland_fix/flutter_app.dart';

void mainCommon({
  required Flavor flavor,
  required String baseUrl,
  required String name,
}) {
  FlavorConfig(flavor: flavor, baseUrl: baseUrl, name: name);
  runApp(const MoorlandApp());
}

/*
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
      home: const HomePage(),
    );
  }
}
*/
