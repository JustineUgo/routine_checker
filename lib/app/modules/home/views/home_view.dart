import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:routine/app/custom/widgets/appbar/appbar.dart';
import 'package:routine/app/modules/home/views/widgets/nextup/nextup.dart';
import 'package:routine/app/modules/home/views/widgets/routines/routines.dart';
import 'package:routine/app/modules/home/views/widgets/timeline/timeline.dart';
import 'package:routine/app/utils/color/color.dart';
import 'package:routine/app/utils/dimensions/dimensions.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () =>controller.navigateToCreate(),
        tooltip: 'Add item',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, 
      bottomNavigationBar: Obx(()=>
        AnimatedBottomNavigationBar(
          inactiveColor: grey,
          activeColor: orange,
          iconSize: 24,
          backgroundColor: dark,
          icons: const [Icons.format_list_bulleted_outlined, Icons.trending_up_outlined,],
          activeIndex: controller.pageIndex.value,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.smoothEdge,
          onTap: (index) {
            controller.switchScreen(index);
          }
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Appbar(day: 'Today',),
            DateTimeline(),
            Obx(()=>
              Container(
                padding: EdgeInsets.only(bottom: Dimensions.basePadding/2),
                child: Text(
                  controller.pageIndex.value==0? 'All routines - all your active routines'
                  :'Next up - routines in the next 12 hours',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: grey
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView(
                onPageChanged: (value) => controller.switchScreen(value),
                controller: controller.pageController,
                children: [
                  Obx(()=> controller.routines.isEmpty?
                    Center(
                      child: Text(
                        "You don't have any routine for today.",
                        style: Theme.of(context).textTheme.headline4,
                      )
                    ):AllRoutines(controller: controller,),
                  ),

                  Obx(()=> controller.routines.isEmpty?
                    Center(
                      child: Text(
                        "You don't have any routine within the next 12 hours.",
                        style: Theme.of(context).textTheme.headline4,
                      )
                    ):NextUp(controller: controller,),
                  ),
                  
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}


