
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routine/app/modules/routine/controllers/routine_controller.dart';
import 'package:routine/app/utils/color/color.dart';
import 'package:routine/app/utils/dimensions/dimensions.dart';

class Frequency extends StatelessWidget {
  const Frequency({
    Key? key, required this.controller,
  }) : super(key: key);
  final RoutineController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Icons.schedule_outlined, size: 16),
            SizedBox(width: Dimensions.basePadding),
            Text(
              'Frequency',
              style: Theme.of(context).textTheme.headline5
            ),
          ],
        ),
        PopupMenuButton<String>(
          padding: EdgeInsets.zero,
          onSelected: (value){
            controller.selectFrequency(value);
          },
          itemBuilder: (context) => [
            PopupMenuItem<String>( 
              value: "Hourly", 
              child: Row( 
                children: [
                  Text(
                    "Hourly",
                    style: Theme.of(context).textTheme.headline6,
                  )
                ],
              ),
            ),
            PopupMenuItem(
              value: "Daily",
              child: Row(
                children: [
                  Text(
                    "Daily",
                    style: Theme.of(context).textTheme.headline6,
                  )
                ],
              ),
            ),
            PopupMenuItem(
              value: "Weekly",
              child: Row(
                children: [
                  Text(
                    "Weekly",
                    style: Theme.of(context).textTheme.headline6,
                  )
                ],
              ),
            ),
            PopupMenuItem(
              value: "Monthly",
              child: Row(
                children: [
                  Text(
                    "Monthly",
                    style: Theme.of(context).textTheme.headline6,
                  )
                ],
              ),
            ),
            PopupMenuItem(
              value: "Yearly",
              child: Row(
                children: [
                  Text(
                    "Yearly",
                    style: Theme.of(context).textTheme.headline6,
                  )
                ],
              ),
            ),
          ],
          offset: const Offset(0, 30),
          elevation: 2,
          child: Material(
            borderRadius: BorderRadius.all(Radius.circular(Dimensions.baseBorderRadius)),
            color: orange.withOpacity(.1),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Obx(()=>
                    Text(
                      controller.freqency.value,
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: orange
                      ),
                    ),
                  ),
                  SizedBox(width: Dimensions.basePadding,),
                  Icon(
                    Icons.arrow_drop_down
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
