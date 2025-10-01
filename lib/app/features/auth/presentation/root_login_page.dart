import 'package:flutter/material.dart';
import 'package:moorland_fix/app/shared/index.dart';

// layouts
import 'package:moorland_fix/app/features/auth/presentation/layouts/index.dart';

// shared
import 'package:moorland_fix/app/shared/index.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return UIResponsiveLayout(
        compactLayout: CompactLayout(),
        mediumLayout: CompactLayout(),
        expandedLayout: CompactLayout());
  }
}
