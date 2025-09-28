import 'package:flutter/material.dart';
// shared
import 'package:moorland_fix/app/shared/index.dart';

// theme
import 'package:moorland_fix/app/theme/index.dart';

class UIDropDown<T> extends StatefulWidget {
  final List<T> items;
  final String hintText;
  final String? value;
  final ValueChanged<String?> onChanged;
  final FormFieldValidator<String>? validator;
  final String Function(T item) itemText;
  final String Function(T item) itemValue;
  final Widget Function(T item)? customItemBuilder;
  final InputDecoration? decoration;
  final Widget? icon;
  final bool isExpanded;
  final Color? dropdownColor;
  final bool? isDisabled;

  const UIDropDown({
    super.key,
    required this.items,
    required this.hintText,
    required this.onChanged,
    required this.itemText,
    required this.itemValue,
    this.value,
    this.validator,
    this.customItemBuilder,
    this.decoration,
    this.icon,
    this.isExpanded = true,
    this.dropdownColor,
    this.isDisabled
  });

  @override
  State<UIDropDown<T>> createState() => _UIDropDownState<T>();
}

class _UIDropDownState<T> extends State<UIDropDown<T>> {
  String? selectedValue; // Changed to nullable

  @override
  void initState() {
    super.initState();
    selectedValue =
        widget.value; // No need for ! since selectedValue is nullable
  }

  @override
  void didUpdateWidget(covariant UIDropDown<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      setState(() {
        selectedValue = widget.value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final brightness = DeviceUtils.isDarkMode(context);

    return DropdownButtonFormField<String>(
      value: selectedValue,
      // Can be null, which is fine for dropdown
      hint: Text(
        widget.hintText,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 15,
          fontWeight: FontWeight.w300,
        ),
      ),
      items:
          widget.items.map((T item) {
            return DropdownMenuItem<String>(
              value: widget.itemValue(item),
              child:
                  widget.customItemBuilder != null
                      ? widget.customItemBuilder!(item)
                      : Text(
                        widget.itemText(item),
                        style: const TextStyle(fontSize: 14),
                      ),
            );
          }).toList(),
      onChanged: widget.isDisabled == false ? (String? newValue) {
        setState(() {
          selectedValue =
              newValue; // No need for ! since selectedValue is nullable
        });
        widget.onChanged(newValue);
      } : null,
      validator: widget.validator,
      decoration:
          widget.decoration ??
          InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: Constants.spaceSmall,
              vertical: 12,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.primary),
            ),
          ),
      icon:
          widget.icon ?? const Icon(Icons.arrow_drop_down, color: Colors.grey),
      isExpanded: widget.isExpanded,
      dropdownColor: brightness == true ?  AppColors.darkSurface : AppColors.lightSurface, // Colors.white,
      borderRadius: BorderRadius.circular(8),
    );
  }
}
