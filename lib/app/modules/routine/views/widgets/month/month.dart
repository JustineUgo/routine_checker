
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routine/app/modules/routine/controllers/routine_controller.dart';
import 'package:routine/app/utils/color/color.dart';
import 'package:routine/app/utils/dimensions/dimensions.dart';

class Month extends StatefulWidget {
  const Month({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final RoutineController controller;

  @override
  State<Month> createState() => _MonthState();
}

class _MonthState extends State<Month> {
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
              'Set day of each month',
              style: Theme.of(context).textTheme.headline5
            ),
          ],
        ),
        PopupMenuButton<String>(
          position: PopupMenuPosition.under,
          padding: EdgeInsets.zero,
          onSelected: (value){
            widget.controller.selectMonthDay(value); 
          },
          itemBuilder: (context) => List.generate(30, (index) => (index+1).toString()).map(
            (day) => PopupMenuItem<String>( 
              value: day, 
              child: Row( 
                children: [
                  Text(
                    day,
                    style: Theme.of(context).textTheme.headline6,
                  )
                ],
              ),
            ),
          ).toList(),
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
                      widget.controller.monthDay.value,
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
