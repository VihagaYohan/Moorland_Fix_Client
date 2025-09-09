import 'package:flutter/material.dart';

// widgets
import 'package:moorland_fix/app/shared/index.dart';

// routes
import 'package:moorland_fix/app/routes/index.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return UIContainer(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Welcome, please sign in"
            ),
            UIFilledButton(onPressed: () {
              Navigator.pushNamed(context, Routes.home);
            }, label: "Sign in with Google"),
          ],
        ),
      ),
    );
  }
}
