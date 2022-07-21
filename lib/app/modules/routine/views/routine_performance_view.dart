import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routine/app/modules/routine/views/widgets/routine_info_card/routine_info_card.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:routine/app/custom/models/chart/chart.dart';
import 'package:routine/app/custom/widgets/topbar/topbar.dart';
import 'package:routine/app/modules/routine/controllers/routine_controller.dart';
import 'package:routine/app/modules/routine/views/widgets/performance_label/performance_label.dart';
import 'package:routine/app/utils/color/color.dart';
import 'package:routine/app/utils/dimensions/dimensions.dart';

class RoutinePerformanceView extends GetView<RoutineController> {
  const RoutinePerformanceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(controller.parser.getEmoji('🥺'));
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Topbar(day: 'Rountine performance',),
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
            SizedBox(
              height: Get.height/3,
              child: Stack(
                children: [
                  SfCircularChart(
                    palette: [
                      backgroundSecondary,
                      green,
                    ], 
                    series: <CircularSeries>[
                      DoughnutSeries<ChartData, String>(
                        dataSource: controller.data,
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y,
                        innerRadius: '70%',
                      )
                    ]
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: Get.height/3,
                    width: Get.width,
                    child: Text(
                      '70%',
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontSize: 30,
                        fontWeight: FontWeight.w900
                      ),
                    ),
                  ),
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
            Expanded(
              // height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    controller.parser.emojify(' :pleading_face: '),
                    style: TextStyle(
                      fontSize: 50,
                    ),
                  ),
                  SizedBox(height: Dimensions.p adding*2,),
                  Text(
                    'Good job! You have over 70%',
                    style: Theme.of(context).textTheme.headline2
                  ),
                ],
              )
            ),
            RoutineInfoCard(
              title: 'Title', 
              subtitle: controller.homeController.selectedRoutine.value.title!,
            ),
            RoutineInfoCard(
              title: 'Description', 
              subtitle: controller.homeController.selectedRoutine.value.description!
            ),
            SizedBox(height: Dimensions.padding*2,),
          ],
        ),
      ),
    );
  }
}
