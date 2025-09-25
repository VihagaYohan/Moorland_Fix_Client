import 'package:flutter/material.dart';

class CalendarDayCell extends StatelessWidget {
  final DateTime currentDay;
  final Color backgroundColor;
  final Color textColor;

   CalendarDayCell({
    super.key,
    required this.currentDay,
    required this.backgroundColor,
    required this.textColor,
  });

  double size = 50.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      child: Center(
        child: Text("${currentDay.day}",
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: textColor,
        )),
      ),
    );
  }
}
