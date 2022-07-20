import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:routine/app/routes/app_pages.dart';

class RoutineCreateController extends GetxController {
  
  //frequency of routine
  var freqency = 'Hourly'.obs;

  //time of routine
  var time = TimeOfDay.now().obs;

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


  //Pops up the os time dialog
  showTime(BuildContext context) async{
    TimeOfDay? selectedTime = await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if(selectedTime!=null) time(selectedTime);
  }

  //select routine frequency
  selectFrequency(String freq){
    freqency(freq);
  }

  //create routine
  createRoutine(){
    Fluttertoast.showToast(msg: 'Routine created!');
    Get.offAllNamed(Routes.HOME);
  }
}
