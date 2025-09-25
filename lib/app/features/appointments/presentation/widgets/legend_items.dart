import 'package:flutter/material.dart';
// shared
import 'package:moorland_fix/app/shared/index.dart';

class LegendItems extends StatelessWidget {
  const LegendItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Constants.spaceSmall),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          legendItem(context, "Available", Colors.green.withValues(alpha: 0.6)),
          legendItem(context, "Half booked", Colors.orange.withValues(alpha: 0.6)),
          legendItem(context, "Fully booked", Colors.grey)
        ],
      ),
    );
  }

  Widget legendItem(BuildContext context, String label, Color color) {
    final size = 30.0;
    return Column(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle
          ),
        ),
        const SizedBox(height: Constants.spaceSmall),
        Text(label, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}
