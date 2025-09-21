import 'package:encrypt_shared_preferences/provider.dart';
import 'package:flutter/material.dart';
import 'package:moorland_fix/app/features/appointments/presentation/provider/appointments_provider.dart';
// providers
import 'package:moorland_fix/app/features/auth/presentation/provider/auth_provider.dart';
// pages
import 'package:moorland_fix/app/features/index.dart';
// routes
import 'package:moorland_fix/app/routes/app_navigator.dart';
// shared
import 'package:moorland_fix/app/shared/index.dart';
// theme
import 'package:moorland_fix/app/theme/index.dart';
import 'package:provider/provider.dart';

// di
import './app/injections/injection_container.dart' as di;

class MoorlandApp extends StatefulWidget {
  const MoorlandApp({super.key});

  @override
  State<MoorlandApp> createState() => _MoorlandAppState();
}

class _MoorlandAppState extends State<MoorlandApp> {
  bool _userLoggedIn = false;

  getLoggedInState() async {
    final storage = await EncryptStorage.create();
    await storage.getValue<String>(Constants.userKey).then((value) {
      if (value == null) {
        setState(() {
          _userLoggedIn = false;
        });
      } else {
        setState((){
          _userLoggedIn = true;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getLoggedInState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => di.getIt<AuthProvider>()),
        ChangeNotifierProvider(create: (_) => di.getIt<AppointmentProvider>()),
      ],
      child: MaterialApp(
        title: "Moorland Fix",
        theme: lightTheme,
        darkTheme: darkTheme,
        routes: AppNavigator.routes,
        home: _userLoggedIn == true ? const HomePage() : const LoginPage(),
      ),
    );
  }
}
