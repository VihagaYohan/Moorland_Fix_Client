import 'package:flutter/material.dart';

// shared
import 'package:moorland_fix/app/shared/index.dart';

// theme
import 'package:moorland_fix/app/theme/index.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: Constants.spaceLarge),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "By continuing, you agree to our",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: "Terms",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(text: " and ",
                          style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(
                        text: "Privacy Policy",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: Constants.spaceSmall),
            Text(
              "© 2025 Moorland Fix. All rights reserved.",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 12
              ),
            ),
          ],
        ),
      );
  }
}
