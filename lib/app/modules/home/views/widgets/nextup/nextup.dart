
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routine/app/custom/models/routine/routine.dart';
import 'package:routine/app/modules/home/controllers/home_controller.dart';
import 'package:routine/app/modules/home/views/widgets/routine_card/routine_card.dart';

class NextUp extends StatefulWidget {
  const NextUp({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  State<NextUp> createState() => _NextUpState();
}

class _NextUpState extends State<NextUp> {
  @override
  Widget build(BuildContext context) {
    return Obx(()=>
      ListView.builder(
          itemCount: widget.controller.nextRoutines.length,
        itemBuilder: (context, index){
          
          Routine routine = widget.controller.nextRoutines[index];
          return RoutineCard(controller: widget.controller, routine: routine,);
        }
      ),
    );
  }
}