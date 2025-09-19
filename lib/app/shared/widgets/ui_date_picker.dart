import 'package:flutter/material.dart';
// shared
import 'package:moorland_fix/app/shared/index.dart';
// theme
import 'package:moorland_fix/app/theme/index.dart';

class UIDatePicker extends StatefulWidget {
  final String hintText;
  final String Function(DateTime? value) value;
  final FormFieldValidator<String>? validator;
  final TextEditingController controller;
  DateTime? pickedDate = DateTime.now();

  UIDatePicker({
    super.key,
    required this.hintText,
    required this.value,
    required this.validator,
    required this.controller,
  });

  @override
  State<UIDatePicker> createState() => _UIDatePickerState();
}

class _UIDatePickerState extends State<UIDatePicker> {
  late FocusNode _focusNode;
  bool isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        DeviceUtils.getDatePicker(context).then((value) {
          setState(() {
            widget.pickedDate = value!;
            widget.controller.text = AppFormatter.formatDate(
              widget.pickedDate!,
            );
          });
        });
      },
      child: TextFormField(
        readOnly: true,
        enabled: false,
        controller: widget.controller,
        decoration: InputDecoration(
          labelText: widget.hintText,
          labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Colors.grey,
            fontWeight: FontWeight.w300,
          ),
          floatingLabelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
          enabledBorder: OutlineInputBorder().copyWith(
            borderSide: BorderSide(color: Colors.grey),
          ),
          contentPadding: const EdgeInsets.all(Constants.spaceSmall),
        ),
      ),
    );
  }
}
