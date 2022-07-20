import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:routine/app/custom/widgets/topbar/topbar.dart';
import 'package:routine/app/modules/home/controllers/routine_create_controller.dart';
import 'package:routine/app/utils/color/color.dart';
import 'package:routine/app/utils/dimensions/dimensions.dart';

class RoutineCreateView extends GetView<RoutineCreateController> {
  const RoutineCreateView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Topbar(day: 'Create rountine',),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.basePadding*2, 
                  vertical: Dimensions.basePadding
                ),
                child: Column(
                  children: [
                    const TextField(
                      decoration: InputDecoration(
                        label: Text('Title')
                      ),
                    ),
                    SizedBox(height: Dimensions.basePadding*2),
                    const TextField(
                      decoration: InputDecoration(
                        label: Text('Description')
                      ),
                    ),
                    SizedBox(height: Dimensions.basePadding*2),
                    Frequency(controller: controller,),
                    SizedBox(height: Dimensions.basePadding*2),
                    Time(controller: controller, ),
                    const Spacer(),
                    SizedBox(
                      width: Get.width,
                      height: 50,
                      child: TextButton(
                        onPressed: ()=>controller.createRoutine(), 
                        child: Text(
                          'Done',
                          style: Theme.of(context).textTheme.headline2!.copyWith(
                            color: orange
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: Dimensions.padding),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Frequency extends StatelessWidget {
  const Frequency({
    Key? key, required this.controller,
  }) : super(key: key);
  final RoutineCreateController controller;

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

class Time extends StatefulWidget {
  const Time({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final RoutineCreateController controller;

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
