import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moorland_fix/app/features/auth/domain/entities/_index.dart';
import 'package:moorland_fix/app/features/auth/presentation/provider/auth_provider.dart';

// widget
import 'package:moorland_fix/app/features/auth/presentation/widgets/index.dart';
import 'package:moorland_fix/app/features/home/presentation/root_home_page.dart';
import 'package:moorland_fix/app/shared/index.dart';

// provider
import 'package:provider/provider.dart';

class CompactLayout extends StatefulWidget {
  const CompactLayout({super.key});

  @override
  State<CompactLayout> createState() => _CompactLayoutState();
}

class _CompactLayoutState extends State<CompactLayout> {
  // handle authentication
  handleAuthentication(AuthProvider authProvider, BuildContext context) async {
    var result = await authProvider.signInWithGoogle();
    if (result.isSuccess) {
      // save user details on encrypted storage
      UserEntity userDetails = result.data!;
      final storage = await EncryptStorage.create();
      await storage.setValue<String>(
        Constants.userKey,
        jsonEncode(userDetails),
      );

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      print(result.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Footer(),
      body: SafeArea(
        child: Center(
          child: Consumer<AuthProvider>(
            builder: (context, authProvider, child) {
              if (authProvider.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (authProvider.getError != null) {
                return Center(child: Text(authProvider.getError.toString()));
              } else {
                return SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      // title
                      Text(
                        "Moorland Fix",
                        style: Theme.of(context).textTheme.displayLarge,
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: Constants.spaceSmall),

                      // tag line
                      Text(
                        "Quick solutions, Trusted experts",
                        style: Theme.of(
                          context,
                        ).textTheme.headlineSmall!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey,
                          letterSpacing: 1.5,
                        ),
                      ),


                      const SizedBox(height: Constants.spaceLarge * 2),

                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Constants.spaceMedium,
                          ),
                          child: UIFilledButton(
                            label: 'Sign In',
                            onPressed: () {
                              handleAuthentication(authProvider, context);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );

    /*return Scaffold(
      bottomNavigationBar: Footer(),
      body: SafeArea(
        child: Center(
          child: Consumer<AuthProvider>(
            builder: (context, authProvider, child) {
              if (authProvider.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else {
                SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      // title
                      Text(
                        "Moorland Fix",
                        style: Theme.of(context).textTheme.displayLarge,
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: Constants.spaceSmall),

                      // tag line
                      Text(
                        "Quick solutions, Trusted experts",
                        style: Theme.of(
                          context,
                        ).textTheme.headlineSmall!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey,
                          letterSpacing: 1.5,
                        ),
                      ),

                      const SizedBox(height: Constants.spaceLarge * 2),

                      // image container
                      Container(width: 200, height: 200, color: Colors.red),

                      const SizedBox(height: Constants.spaceLarge * 2),

                      // sign-in button
                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Constants.spaceMedium,
                          ),
                          child: UIFilledButton(
                            label: 'Sign In',
                            onPressed: () {
                              authProvider.signInWithGoogle();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );*/
  }
}
