import 'package:flutter/material.dart';
// shared
import 'package:moorland_fix/app/shared/index.dart';

class UIContainer extends StatelessWidget {
  final Widget child;
  final PreferredSizeWidget? appbar;
  final bool showAppBar;
  final Widget? footer;
  final bool showFooter;
  final double paddingTop;
  final double paddingBottom;
  final double paddingLeft;
  final double paddingRight;

  const UIContainer({
    super.key,
    required this.child,
    this.appbar,
    this.showAppBar = false,
    this.footer,
    this.showFooter = false,
    this.paddingTop = Constants.spaceSmall,
    this.paddingBottom = Constants.spaceSmall,
    this.paddingLeft = Constants.spaceSmall,
    this.paddingRight = Constants.spaceSmall,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: showAppBar ? appbar : null,
        body: Container(
          padding: EdgeInsets.only(
            left: paddingLeft,
            right: paddingRight,
            top: paddingTop,
            bottom: paddingBottom,
          ),
          child: child,
        ),
        bottomNavigationBar: showFooter ? footer : null,
      ),
    );
  }
}
