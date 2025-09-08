import 'package:flutter/material.dart';

// routes
import './routes.dart';

// pages
import '../features/index.dart';

class AppNavigator {
  static Map<String, WidgetBuilder> routes = {
    Routes.onboarding: (context) => const OnboardingPage(),
    Routes.login: (context) => const LoginPage()
  };
}