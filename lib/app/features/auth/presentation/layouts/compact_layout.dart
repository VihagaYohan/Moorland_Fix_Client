import 'package:flutter/material.dart';

// shared
import 'package:moorland_fix/app/shared/index.dart';

// theme
import 'package:moorland_fix/app/theme/index.dart';

class CompactLayout extends StatefulWidget {
  const CompactLayout({super.key});

  @override
  State<CompactLayout> createState() => _CompactLayoutState();
}

class _CompactLayoutState extends State<CompactLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                // title
                Text(
                  "Moorland Fix",
                  style: Theme.of(context).textTheme.displayLarge,
                  textAlign: TextAlign.center,
                ),

                const SizedBox(
                  height: Constants.spaceSmall,
                ),

                // tag line
                Text(
                    "Quick solutions, Trusted experts",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey,
                        letterSpacing: 1.5
                    )
                ),

                const SizedBox(
                    height: Constants.spaceLarge * 2
                ),

                // image container
                Container(
                  width: 200,
                  height: 200,
                  color: Colors.red,
                ),

                const SizedBox(
                    height: Constants.spaceLarge * 2
                ),

                // sign-in button
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: Constants.spaceMedium),
                    child: UIFilledButton(
                      label: 'Sign In',
                      onPressed: (){},
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
