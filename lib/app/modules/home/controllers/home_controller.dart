
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:routine/app/custom/models/routine.dart';
import 'package:routine/app/routes/app_pages.dart';
import 'package:routine/app/utils/color/color.dart';
import 'package:routine/app/utils/constants/duration/duration.dart';

class HomeController extends GetxController {
  //storage
  GetStorage storage  = GetStorage();
  
  //page view controller
  PageController pageController = PageController();

  //index of page
  var pageIndex = 0.obs;

  //reative list of routines
  var routines = <Routine>[].obs;

  //map of color to identify frequency
  Map<String, Color> frequencyColors = {
    'Hourly': hourly, 
    'Daily': daily, 
    'Weekly': weekly, 
    'Monthly': monthly, 
    'Yearly': yearly
  };

  //selected routine to edit, overview, see performance 
  Rx<Routine> selectedRoutine = Routine(id: 0).obs;


  @override
  void onInit() {
    // storage.erase();
    loadRoutines();
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

  //load all routines 
  loadRoutines(){
    List _routinesMap = storage.read('routines')??[];
    
    _routinesMap.forEach((routineMap) { 
      routines.add( Routine.fromMap(routineMap));
    });
  }

  //switch the screen btw ALL and NEXTUP
  void switchScreen(int index){
    pageIndex.value = index;
    pageController.animateToPage(pageIndex.value, duration: Durations.animation, curve: Curves.easeInOut);
  }


  //Navigate to routine creation screen
  void navigateToCreate(){
          Get.toNamed(Routes.CREATE);
  }

  //Navigate to routine edit screen
  void navigate(int value, Routine routine){
    //edit
    if(value==1){
      selectedRoutine(routine);
      Get.toNamed(Routes.EDIT);
    }
  }

}
