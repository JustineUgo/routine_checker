
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:routine/app/routes/app_pages.dart';
import 'package:routine/app/utils/color/color.dart';
import 'package:routine/app/utils/constants/duration/duration.dart';

class HomeController extends GetxController {
  PageController pageController = PageController();

  var pageIndex = 0.obs;
  
  List<Color> frequency = [hourly, daily, weekly, monthly, yearly];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  //switch the screen btw ALL and NEXTUP
  void switchScreen(int index){
    pageIndex.value = index;
    pageController.animateToPage(pageIndex.value, duration: Durations.animation, curve: Curves.easeInOut);
  }


  //Navigate to routine creation screen
  void navigateToCreate(){
          Get.toNamed(Routes.CREATE);
    // Get.toNamed(Routes.HOME)
  }

}
