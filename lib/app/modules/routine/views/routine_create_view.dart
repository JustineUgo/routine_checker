import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:routine/app/custom/widgets/topbar/topbar.dart';
import 'package:routine/app/modules/routine/controllers/routine_controller.dart';
import 'package:routine/app/modules/routine/views/widgets/frequency/frequency.dart';
import 'package:routine/app/modules/routine/views/widgets/time/time.dart';
import 'package:routine/app/utils/color/color.dart';
import 'package:routine/app/utils/dimensions/dimensions.dart';

class RoutineCreateView extends GetView<RoutineController> {
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
                    Time(controller: controller, ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'For the purpose of this test, \nall routines should expire after 15 minutes.',
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
          ],
        ),
      ),
    );
  }
}
