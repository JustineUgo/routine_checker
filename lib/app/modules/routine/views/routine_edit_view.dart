import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:routine/app/custom/widgets/topbar/topbar.dart';
import 'package:routine/app/modules/routine/controllers/routine_controller.dart';
import 'package:routine/app/utils/color/color.dart';
import 'package:routine/app/utils/dimensions/dimensions.dart';

class RoutineEditView extends  GetView<RoutineController>  {
  const RoutineEditView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.titleController.text = controller.homeController.selectedRoutine.value.title!;
    controller.descController.text = controller.homeController.selectedRoutine.value.description!;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Topbar(day: 'Edit rountine',),
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
                    
                    // SizedBox(height: Dimensions.basePadding*2),
                    // Frequency(controller: controller,),
                    // SizedBox(height: Dimensions.basePadding*2),
                    // Time(controller: controller, ),
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
                        onPressed: ()=>controller.confirmInputs(update: true), 
                        child: Text(
                          'Edit',
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
