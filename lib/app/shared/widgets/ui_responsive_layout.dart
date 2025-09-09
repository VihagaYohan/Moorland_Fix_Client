import 'package:flutter/material.dart';
// utils
import 'package:moorland_fix/app/shared/index.dart';

class UIResponsiveLayout extends StatelessWidget {
  final Widget compactLayout;
  final Widget mediumLayout;
  final Widget expandedLayout;

  const UIResponsiveLayout({
    super.key,
    required this.compactLayout,
    required this.mediumLayout,
    required this.expandedLayout,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < Breakpoints.mobile) {
      return compactLayout;
    } else if (width < Breakpoints.tablet) {
      return mediumLayout;
    } else {
      return expandedLayout;
    }
  }
}
