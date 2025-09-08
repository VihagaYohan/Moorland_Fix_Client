import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// data
import 'package:moorland_fix/app/features/onboarding/data/onboarding_item.dart';
// utils
import 'package:moorland_fix/app/shared/index.dart';

Widget pageItem(OnboardingItem item, BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: Constants.spaceMedium),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SvgPicture.asset(item.imageAsset, height: 200, width: 200),

        const SizedBox(height: Constants.spaceMedium),

        Text(
          item.title,
          style: Theme.of(context).textTheme.displayLarge,
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: Constants.spaceMedium),

        Text(
          item.description,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 14),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
