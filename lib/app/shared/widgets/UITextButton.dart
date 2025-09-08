import 'package:flutter/material.dart';

// shared
import 'package:moorland_fix/app/shared/index.dart';
import 'package:moorland_fix/app/theme/app_colors.dart';

class UITextButton extends StatelessWidget{
  final String label;
  final Function onPress;
  final TextStyle? textStyle;

  const UITextButton({
    super.key,
    required this.label,
    required this.onPress,
    required this.textStyle
});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () { onPress(); },

      child: Text(
        label,
        style: textStyle ?? Theme.of(context).textTheme.labelMedium
      ),
    );
  }
}