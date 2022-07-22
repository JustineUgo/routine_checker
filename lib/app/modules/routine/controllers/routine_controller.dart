import 'package:dart_emoji/dart_emoji.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:routine/app/custom/models/chart/chart.dart';
import 'package:routine/app/custom/models/routine/routine.dart';
import 'package:routine/app/modules/home/controllers/home_controller.dart';
import 'package:routine/app/routes/app_pages.dart';

class RoutineController extends GetxController {
  //HomeController
  HomeController homeController = Get.find<HomeController>();
  //storage
  GetStorage storage = GetStorage();

  //emoji
  var parser = EmojiParser();

  //text controllers for fields
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  //months of year
  List<String> monthsList = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August',
          'September', 'October', 'November', 'December'];
  //days of week
  List<String> daysList = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
  
  //frequency of routine
  var freqency = 'Hourly'.obs;

  //time of routine
  var time = TimeOfDay.now().obs;

  //day of routine [if frequency is weekly]
  var day = 'Monday'.obs;

  //minute of routine [if frequency is hourly]
  var minute = '00'.obs;

  //minute of routine [if frequency is monthly]
  var monthDay = '1'.obs;

  //minute of routine [if frequency is yearly]
  var yearMonth = 'January'.obs;

  //first day of routine [inessence - date of routine]
  // var date = DateTime.now().obs;

  List<ChartData> data = [
    ChartData('Missed', 0),
    ChartData('Done', 0),
  ];

  @override
  void onInit() {
    _prefillField();
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

  //if editing routine, prefill fields
  _prefillField(){
    if(homeController.selectedRoutine.value.id !=0){
      titleController.text = homeController.selectedRoutine.value.title!;
      descController.text = homeController.selectedRoutine.value.description!;
      freqency(homeController.selectedRoutine.value.frequency!);
      time(homeController.selectedRoutine.value.time!);
    }
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
  
  //select routine day of week - [if freq is weekly]
  selectDay(String weekDay){
    day(weekDay);
  }

  //select routine day of week - [if freq is hourly]
  selectMinute(String routineMinute){
    minute(routineMinute);
  }
  
  //select routine day of week - [if freq is hourly]
  selectMonthDay(String routineMonthDay){
    monthDay(routineMonthDay);
  }
  
  //select routine day of week - [if freq is hourly]
  selectYearMonth(String routineYearMonth){
    yearMonth(routineYearMonth);
  }

  //obtain the next two times the routine will be active
  List<DateTime> getRoutineScheduledDate(
    String freq, 
    int routineMinute, 
    TimeOfDay time, 
    String routineDayofWeek, 
    int routineDayofMonth, 
    String routineMonthofYear){

    late int _day;
    late int _month;
    late int _hour;
    late int _minute;

    //set month
    if(freq=='Yearly'){
      _month = monthsList.indexOf(routineMonthofYear)+1;
    }else{
      _month = DateTime.now().month;
    }
    
    //set day
    if(freq=='Daily' || freq=='Hourly'){
      _day = DateTime.now().day;
    }else{
      if(freq == 'Monthly' || freq == 'Yearly'){
        _day = routineDayofMonth;
      }else{
        String nameOfToday = DateFormat('EEEE').format(DateTime.now());
        
        int diff = daysList.indexOf(routineDayofWeek)-(daysList.indexOf(nameOfToday));
        diff = diff.isNegative? 7 - diff.abs():diff;
        _day = DateTime.now().day + diff;
      }
    }

    //set hour and minute
    if(freq == 'Hourly'){
      _hour = DateTime.now().hour;
      _minute = routineMinute;
    }else{
      _hour = time.hour;
      _minute = time.minute;
    }


    DateTime firstDay = DateTime(2022, _month, _day, _hour, _minute);
    late DateTime secondDay;
    
    if(freq=='Hourly'){
      secondDay = firstDay.add(const Duration(hours: 1));
    }else if(freq=='Daily'){
      secondDay = firstDay.add(const Duration(days: 1));
    }else if(freq == 'Weekly'){
      secondDay = firstDay.add(const Duration(days: 7));
    }else if(freq == 'Monthly'){
      secondDay = firstDay.add(const Duration(days: 30));
    }else{
      secondDay = firstDay.add(const Duration(days: 365));
    }

    return [firstDay, secondDay];
  }

  //create routine
  createRoutine(
    String title, 
    String desc, 
    String freq, 
    int routineMinute, 
    TimeOfDay time,
    String routineDayofWeek,
    int routineDayofMonth,
    String routineMonthofYear, 
  ){
    int id = DateTime.now().millisecond;
    Routine routine = Routine(
      id: id, 
      title: title, 
      description: desc, 
      frequency: freq, 
      time: freq=='Hourly'?TimeOfDay(hour: 0, minute: routineMinute):time, 
      status: -1,
      dateCreated: DateTime.now(),
      dateExpired: DateTime.now().add(const Duration(minutes: 15)),
      datesScheduled: getRoutineScheduledDate(freq, routineMinute, time, routineDayofWeek, routineDayofMonth, routineMonthofYear),
      datesDone: [],
      datesMissed: [],
    );
// print(routine.datesScheduled);
    List _routines = storage.read('routines')??[];
    _routines.add(routine.toMap());
    storage.write('routines', _routines);

    Fluttertoast.showToast(msg: 'Routine created!');
    Get.offAllNamed(Routes.HOME);
    print(storage.read('routines'));
  }

  //updateRoutine
  updateRoutine({String? title, String? desc, int? status}){
    Routine _routine = homeController.selectedRoutine.value;
    List<Routine> _routines = homeController.routines;
    late Routine actualRoutine;

    for (Routine routine in _routines) { 
      if(routine.id == _routine.id)actualRoutine=routine;
    }
    _routines.remove(actualRoutine);  

    //update the routine
    if(title!=null) _routine.title = title;
    if(desc!=null) _routine.description = desc;
    if(status!=null) _routine.status = status; _routine.datesDone!.add(DateTime.now());
    
    _routines.add(_routine);
    

    //update local storage
    List<Map<String, dynamic>> newRoutines = [];
    _routines.forEach((routine) { 
      newRoutines.add(routine.toMap());
    });
    storage.write('routines', newRoutines);

    Fluttertoast.showToast(msg: 'Routine updated!');
    
    //if coming from edit screen 
    if(status==null) {
      Get.offAllNamed(Routes.HOME);
    } else {
      homeController.loadRoutines();
    }
  }

  //verify field are completed
  confirmInputs({bool update=false}){
    if(titleController.text.trim().isEmpty){
      Fluttertoast.showToast(msg: 'Enter title of routine', gravity: ToastGravity.CENTER);
    }else if(descController.text.trim().isEmpty){
      Fluttertoast.showToast(msg: 'Enter description of routine', gravity: ToastGravity.CENTER);
    }else if(update){
      String title = titleController.text.trim();
      String desc = descController.text.trim();
      updateRoutine(title: title, desc: desc);
    }else{
      String title = titleController.text.trim();
      String desc = descController.text.trim();
      String freq = freqency.value;
      int routineMinute = int.parse(minute.value);
      TimeOfDay routineTime = time.value;
      String routineDayofWeek = day.value;
      int routineDayofMonth = int.parse(monthDay.value);
      String routineMonthofYear = yearMonth.value;
      // DateTime routineDate = date.value;

      createRoutine(title, desc, freq, routineMinute, routineTime, routineDayofWeek, routineDayofMonth, routineMonthofYear);
    }
  }
}
