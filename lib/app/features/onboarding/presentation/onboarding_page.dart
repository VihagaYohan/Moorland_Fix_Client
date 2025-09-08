import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  SvgPicture.asset("assets/images/onboarding_experts.svg");
  }
}
