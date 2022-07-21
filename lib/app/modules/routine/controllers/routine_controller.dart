import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:routine/app/custom/models/routine.dart';
import 'package:routine/app/routes/app_pages.dart';

class RoutineController extends GetxController {
  //storage
  GetStorage storage = GetStorage();

  //text controllers for fields
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  
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
  createRoutine(String title, String desc, String freq, TimeOfDay time){
    int id = DateTime.now().millisecond;
    Routine routine = Routine(id: id, title: title, description: desc, frequency: freq, time: time, status: -1);

    List _routines = storage.read('routines')??[];
    _routines.add(routine.toMap());
    storage.write('routines', _routines);

    Fluttertoast.showToast(msg: 'Routine created!');
    Get.offAllNamed(Routes.HOME);
    print(storage.read('routines'));
  }

  //updateRoutine
  updateRoutine(){

    
    Fluttertoast.showToast(msg: 'Routine updated!');
    Get.offAllNamed(Routes.HOME);
    print(storage.read('routines'));
  }

  //verify field are completed
  confirmInputs(){
    if(titleController.text.trim().isEmpty){
      Fluttertoast.showToast(msg: 'Enter title of routine', gravity: ToastGravity.CENTER);
    }else if(descController.text.trim().isEmpty){
      Fluttertoast.showToast(msg: 'Enter description of routine', gravity: ToastGravity.CENTER);
    }else{
      String title = titleController.text.trim();
      String desc = descController.text.trim();
      TimeOfDay routineTime = time.value;
      String freq = freqency.value;

      createRoutine(title, desc, freq, routineTime);
    }
  }
}
