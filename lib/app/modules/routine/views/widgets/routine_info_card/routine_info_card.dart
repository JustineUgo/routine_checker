
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routine/app/utils/color/color.dart';
import 'package:routine/app/utils/dimensions/dimensions.dart';

class RoutineInfoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  const RoutineInfoCard({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.padding),
          child: Container(
            color: backgroundSecondary,
            width: Get.width,
            height: Dimensions.basePadding/2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline2!.copyWith(
              color: grey
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.padding),
          child: const Divider(),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            subtitle,
            style: Theme.of(context).textTheme.headline5!.copyWith(
              color: grey
            ),
          ),
        ),
      ],
    );
  }
}
