import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:routine/app/custom/widgets/topbar/topbar.dart';
import 'package:routine/app/modules/home/views/widgets/timeline/timeline.dart';
import 'package:routine/app/modules/routine/views/widgets/performance_label/performance_label.dart';
import 'package:routine/app/modules/routine/views/widgets/routine_info_card/routine_info_card.dart';
import 'package:routine/app/utils/color/color.dart';
import 'package:routine/app/utils/dimensions/dimensions.dart';

import '../controllers/routine_controller.dart';

class RoutineView extends GetView<RoutineController> {
  const RoutineView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Topbar(day: 'Rountine Overview',),
            DateTimeline(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.padding),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  PerformanceLabel(
                    label: 'Done',
                    count: 15,
                    color: green,),
                  PerformanceLabel(
                    label: 'Missed',
                    count: 12,
                    color: backgroundSecondary,),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.padding),
              child: Container(
                color: backgroundSecondary,
                width: Get.width,
                height: Dimensions.basePadding/2,
              ),
            ),

            RoutineInfoCard(
              title: 'Title', 
              subtitle: controller.homeController.selectedRoutine.value.title!,
            ),
            RoutineInfoCard(
              title: 'Description', 
              subtitle: controller.homeController.selectedRoutine.value.description!
            ),
            RoutineInfoCard(
              title: 'Frequency', 
              subtitle: controller.homeController.selectedRoutine.value.frequency!
            ),
            RoutineInfoCard(
              title: 'Time', 
              subtitle: '${controller.homeController.selectedRoutine.value.time!.hour}:${controller.homeController.selectedRoutine.value.time!.minute}'
            ),
            SizedBox(height: Dimensions.padding*2,),
          ],
        ),
      ),
    );
  }
}
