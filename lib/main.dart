import 'package:flutter/material.dart';
import 'package:moorland_fix/app/features/onboarding/presentation/onboarding_page.dart';

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
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const OnboardingPage()
    );
  }
}
