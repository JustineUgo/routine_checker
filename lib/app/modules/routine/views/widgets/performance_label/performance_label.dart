
import 'package:flutter/material.dart';
import 'package:routine/app/utils/color/color.dart';
import 'package:routine/app/utils/dimensions/dimensions.dart';

class PerformanceLabel extends StatelessWidget {
  const PerformanceLabel({
    Key? key, required this.label, required this.count, required this.color,
  }) : super(key: key);
  final String label;
  final int count;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: Dimensions.basePadding/2,
          backgroundColor: color,
        ),
        SizedBox(width: Dimensions.basePadding),
        Text(
          '$label: $count',
          style: Theme.of(context).textTheme.headline4,
        ),
      ],
    );
  }
}
