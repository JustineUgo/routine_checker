import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:routine/app/custom/widgets/topbar/topbar.dart';
import 'package:routine/app/modules/routine/controllers/routine_controller.dart';
import 'package:routine/app/modules/routine/views/widgets/day/day.dart';
import 'package:routine/app/modules/routine/views/widgets/frequency/frequency.dart';
import 'package:routine/app/modules/routine/views/widgets/minute/minute.dart';
import 'package:routine/app/modules/routine/views/widgets/month/month.dart';
import 'package:routine/app/modules/routine/views/widgets/time/time.dart';
import 'package:routine/app/modules/routine/views/widgets/year/year.dart';
import 'package:routine/app/utils/color/color.dart';
import 'package:routine/app/utils/dimensions/dimensions.dart';

class RoutineCreateView extends GetView<RoutineController> {
  const RoutineCreateView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.titleController.clear();
    controller.descController.clear();
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
                child: SingleChildScrollView(
                  child: Container(
                    height:Get.height-120,
                    child: Column(
                      children: [
                        TextField(
                          textCapitalization: TextCapitalization.sentences,
                          controller: controller.titleController,
                          decoration: const InputDecoration(
                            label: Text('Title')
                          ),
                        ),
                        SizedBox(height: Dimensions.basePadding*2),
                        TextField(
                          textCapitalization: TextCapitalization.sentences,
                          controller: controller.descController,
                          decoration: const InputDecoration(
                            label: Text('Description')
                          ),
                        ),
                        SizedBox(height: Dimensions.basePadding*2),
                        Frequency(controller: controller,),
                        SizedBox(height: Dimensions.basePadding*2),

                        //if frequency is hourly
                        Obx(()=> controller.freqency.value == 'Hourly'?
                          Minute(controller: controller)
                          :Time(controller: controller,),
                        ),
                        SizedBox(height: Dimensions.basePadding*2),

                        //if frequency of routine is weekly
                        Obx(()=> controller.freqency.value == 'Weekly'?
                          Day(controller: controller,):const SizedBox.shrink()
                        ),

                        //if frequency of routine is monthly
                        Obx(()=> controller.freqency.value == 'Monthly' || controller.freqency.value == 'Yearly'?
                          Month(controller: controller,):const SizedBox.shrink()
                        ),
                        SizedBox(height: Dimensions.basePadding*2),

                        //if frequency of routine is yearly
                        Obx(()=> controller.freqency.value == 'Yearly'?
                          Year(controller: controller,):const SizedBox.shrink()
                        ),
                        
                        Expanded(
                          child: Center(
                            child: Text(
                              'For the purpose of this test, \nall routines would expire/deleted \nafter 15 minutes.',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline5!.copyWith(
                                color: grey
                              )
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Get.width,
                          height: 50,
                          child: TextButton(
                            onPressed: ()=>controller.confirmInputs(), 
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
