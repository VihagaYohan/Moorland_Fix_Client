import 'package:flutter/material.dart';
import 'package:moorland_fix/app/features/onboarding/widgets/index.dart';
// widgets
import 'package:moorland_fix/app/shared/index.dart';

// data
import '../data/onboarding_items.dart';

// routes
import 'package:moorland_fix/app/routes/index.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return UIContainer(
      showAppBar: false,
      showFooter: true,
      footer: onboardingFooter(context, currentIndex),
      child: Stack(
        children: <Widget>[
          PageView.builder(
            controller: _pageController,
            itemCount: OnboardingItems.length,
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return pageItem(OnboardingItems[index], context);
            },
          ),
        ],
      ),
    );
  }

  Widget onboardingFooter(BuildContext context, int currentIndex) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: UIFilledButton(
        label:
            currentIndex == OnboardingItems.length - 1 ? "Get Started" : "Next",
        onPressed: () {
          if (currentIndex == OnboardingItems.length - 1) {
            Navigator.pushReplacementNamed(context, Routes.login);
          } else {
            _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn);
          }
        },
      ),
    );
  }
}
