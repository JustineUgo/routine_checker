
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routine/app/modules/routine/controllers/routine_controller.dart';
import 'package:routine/app/utils/color/color.dart';
import 'package:routine/app/utils/dimensions/dimensions.dart';

class Time extends StatefulWidget {
  const Time({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final RoutineController controller;

  @override
  State<Time> createState() => _TimeState();
}

class _TimeState extends State<Time> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Icons.notifications_outlined, size: 16),
            SizedBox(width: Dimensions.basePadding),
            Text(
              'Time',
              style: Theme.of(context).textTheme.headline5
            ),
          ],
        ),
        Material(
          borderRadius: BorderRadius.all(Radius.circular(Dimensions.baseBorderRadius)),
          color: orange.withOpacity(.1),
          child: InkWell(
            onTap: ()=> widget.controller.showTime(context),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
              child: Row(
                children: [
                  Obx(()=>
                    Text(
                      '${widget.controller.time.value.hour}:${widget.controller.time.value.minute}',
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: orange
                      ),
                    ),
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
