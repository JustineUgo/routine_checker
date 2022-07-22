
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:routine/app/custom/models/routine/routine.dart';
import 'package:routine/app/modules/routine/controllers/routine_controller.dart';
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

  //reative list of all routines
  var routines = <Routine>[].obs;

  //reative list of next routines
  var nextRoutines = <Routine>[].obs;

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

  //update routine status
  updateRoutine(Routine routine){
    print('updating');
    
    late RoutineController routineController;
    try{
      routineController = Get.find<RoutineController>();
    }catch(e){
      Get.lazyPut(() => RoutineController());
      routineController = Get.find<RoutineController>();
    }

    //if status not set
    if(routine.status==-1){
      selectedRoutine(routine);
      routineController.updateRoutine(status: 1, );
    }
  }


  //load all routines 
  loadRoutines(){
    routines([]);
    List _routinesMap = storage.read('routines')??[];
    
    _routinesMap.forEach((routineMap) { 
      Routine _routine = Routine.fromMap(routineMap);
      
      //if has not expired
      int diff = _routine.dateCreated!.add(const Duration(minutes: 15)).difference(DateTime.now()).inMinutes;
      if(diff > 0){
        routines.add(_routine.copyWith(expireInfo: '$diff minutes to expire'));
      }
    });

    //update local storage
    _routinesMap = [];
    routines.forEach((routine) { 
      _routinesMap.add(routine.toMap());
    });
    storage.write('routines', _routinesMap);

    loadNextUpRoutines();
  }

  //load next-up routines
  loadNextUpRoutines(){
    nextRoutines([]);
    
    routines.forEach((routine) { 
      //checks if any of the routine scheduled dates are within the next 12 hrs

      int firstHourDiff = (routine.datesScheduled![0].difference(DateTime.now())).inHours;
      int secondHourDiff = (routine.datesScheduled![1].difference(DateTime.now())).inHours;

      if( firstHourDiff <=12 &&
        (routine.datesScheduled![0].difference(DateTime.now())).inHours>=0){
          
          //check if the routine has passed and was missed
          int minuteDiff = (routine.datesScheduled![0].difference(DateTime.now())).inMinutes;
          if(minuteDiff<= -5 && routine.status==-1){
            nextRoutines.add(routine.copyWith(status: 0, info: '${Duration(minutes: minuteDiff).toString().split('.')[0]} passed time'));
          }else{
            minuteDiff<=0? nextRoutines.add(routine.copyWith(info: '${Duration(minutes: minuteDiff).toString().split('.')[0]} passed time')):
            nextRoutines.add(routine.copyWith(info: '${Duration(minutes: minuteDiff).toString().split('.')[0]} to routine'));
          }
        
      }else if( secondHourDiff <=12 &&
       (routine.datesScheduled![1].difference(DateTime.now())).inHours >=0 ){
        
          //check if the routine has passed and was missed 
          int minuteDiff = (routine.datesScheduled![1].difference(DateTime.now())).inMinutes;
          // print();

          if(minuteDiff <= -5  && routine.status==-1){
            nextRoutines.add(routine.copyWith(status: 0, info: '${Duration(minutes: minuteDiff).toString().split('.')[0]} passed time'));
          }else{
            minuteDiff<=0? nextRoutines.add(routine.copyWith(info: '${Duration(minutes: minuteDiff).toString().split('.')[0]} passed time')):
            nextRoutines.add(routine.copyWith(info: '${Duration(minutes: minuteDiff).toString().split('.')[0]} to routine'));
          }
      }
    }); 
    
  }


  //switch the screen btw ALL and NEXTUP
  void switchScreen(int index){
    if(index==1) loadNextUpRoutines();
    else loadRoutines();
    pageIndex.value = index;
    pageController.animateToPage(pageIndex.value, duration: Durations.animation, curve: Curves.easeInOut);
  }


  //Navigate to routine creation screen
  void navigateToCreate(){
          Get.toNamed(Routes.CREATE);
  }

  //Navigate to routine edit screen
  void navigate(int value, Routine routine){
    selectedRoutine(routine);
    
    //edit
    if(value==1){
      Get.toNamed(Routes.EDIT);
    }else if(value==2){
      //overview
      Get.toNamed(Routes.OVERVIEW);
    }else{
      //performance
      Get.toNamed(Routes.PERFORMANCE);
    }
  }

}
