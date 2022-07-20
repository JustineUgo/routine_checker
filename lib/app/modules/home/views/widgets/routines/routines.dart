
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routine/app/custom/models/routine.dart';
import 'package:routine/app/modules/home/controllers/home_controller.dart';
import 'package:routine/app/modules/home/views/widgets/routine_card/routine_card.dart';

class AllRoutines extends StatefulWidget {
  const AllRoutines({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  State<AllRoutines> createState() => _AllRoutinesState();
}

class _AllRoutinesState extends State<AllRoutines> {
  @override
  Widget build(BuildContext context) {
    return Obx(()=>
      ListView.builder(
        itemCount: widget.controller.routines.length,
        itemBuilder: (context, index){
          Routine routine = widget.controller.routines[index];
          return RoutineCard(controller: widget.controller, routine: routine,);
        }
      ),
    );
  }
}
