import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// di
import './app/injections/injection_container.dart' as di;
// providers
import 'package:moorland_fix/app/features/auth/presentation/provider/auth_provider.dart';
// pages
import 'package:moorland_fix/app/features/index.dart';
// routes
import 'package:moorland_fix/app/routes/app_navigator.dart';
// theme
import 'package:moorland_fix/app/theme/index.dart';


class MoorlandApp extends StatelessWidget {
  const MoorlandApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => di.getIt<AuthProvider>())
      ],
      child: MaterialApp(
        title: "Moorland Fix",
        theme: lightTheme,
        darkTheme: darkTheme,
        routes: AppNavigator.routes,
        home: const LoginPage(),
      ),
    );
  }
}
