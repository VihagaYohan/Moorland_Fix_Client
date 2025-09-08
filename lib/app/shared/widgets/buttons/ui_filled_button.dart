import 'package:flutter/material.dart';
import 'package:moorland_fix/app/shared/constants.dart';

class UIFilledButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  final double? width;

  const UIFilledButton({
    super.key,
    this.label = "Next",
    required this.onPressed,
    this.width
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: FilledButton(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Constants.spaceSmall),
          ),

        ),
        onPressed: () {
          onPressed();
        },
        child: Text(
          label,
          style: Theme.of(
            context,
          ).textTheme.labelLarge!.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
