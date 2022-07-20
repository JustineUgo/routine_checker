
import 'package:flutter/material.dart';
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
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index){
        index = index==0?1:index;
        int colorIndex = widget.controller.frequency.length%index;
        colorIndex = colorIndex>4 ? 4: colorIndex;
        return RoutineCard(controller: widget.controller, colorIndex: colorIndex, status: 0,);
      }
    );
  }
}
