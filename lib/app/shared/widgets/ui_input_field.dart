import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class UiInputField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? hintText;
  final bool isPassword;
  final TextInputType? keyboardType;
  final bool? obsecureText;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final bool? showIcon;
  final Widget? icon;
  final Color? iconColor;
  final bool? showSuffixIcon;
  final Widget? suffixIcon;
  final Color? suffixIconColor;
  final dynamic? borderColor;
  final bool readOnly;
  final bool enabled;
  final int? maxLines;
  final bool expands;

  const UiInputField({
    super.key,
    required this.controller,
    required this.labelText,
    this.hintText,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.obsecureText = false,
    this.textInputAction = TextInputAction.done,
    this.onFieldSubmitted,
    this.validator,
    this.showIcon = false,
    this.icon,
    this.iconColor = AppColors.primary,
    this.borderColor = Colors.grey,
    this.readOnly = false,
    this.enabled = true,
    this.maxLines = 1,
    this.expands = false,
    this.showSuffixIcon,
    this.suffixIcon,
    this.suffixIconColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: keyboardType,
      showCursor: true,
      cursorColor: AppColors.primary,
      cursorWidth: 1,
      focusNode: FocusNode(),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Colors.grey,
          fontWeight: FontWeight.w300,
        ),
        floatingLabelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.w500,
            fontSize: 16),
        prefixIcon: showIcon == true ? icon : null,
        prefixIconColor: iconColor,
        suffixIcon: showSuffixIcon == true ? this.suffixIcon : null,
        suffixIconColor: this.suffixIconColor,
        enabledBorder: const OutlineInputBorder()
            .copyWith(borderSide: BorderSide(color: borderColor)),
        contentPadding: const EdgeInsets.all(8),
      ),
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
      textAlign: TextAlign.left,
      readOnly: readOnly,
      enabled: enabled,
      maxLines: maxLines,
      expands: expands,
    );
  }
}
