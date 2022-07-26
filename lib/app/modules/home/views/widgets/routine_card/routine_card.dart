
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routine/app/custom/models/routine/routine.dart';
import 'package:routine/app/modules/home/controllers/home_controller.dart';
import 'package:routine/app/utils/color/color.dart';
import 'package:routine/app/utils/dimensions/dimensions.dart';

class RoutineCard extends StatefulWidget {
  const RoutineCard({
    Key? key,
    required this.controller, required this.routine, this.isList=false
  }) : super(key: key);

  final HomeController controller;
  final Routine routine;
  final bool isList;

  @override
  State<RoutineCard> createState() => _RoutineCardState();
}

class _RoutineCardState extends State<RoutineCard> {
  var timeDetails = ''.obs;
// ${widget.routine.time!.hour}:${widget.routine.time!.minute} * ${widget.routine.frequency}

  @override
  Widget build(BuildContext context) {
    timeDetails(widget.isList? widget.routine.frequency!+' * '+widget.routine.expireInfo!: widget.routine.info);
    return Column(
      children: [
        ListTile(
          minLeadingWidth: 0,
          tileColor: backgroundSecondary,
          leading:  widget.isList?PopupMenuButton<int>(
            padding: EdgeInsets.zero,
            onSelected: (value)=> widget.controller.navigate(value, widget.routine),
            itemBuilder: (context) => [
              PopupMenuItem( 
                value: 1, 
                child: Row( 
                  children: [
                    Icon(Icons.edit),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Edit",
                      style: Theme.of(context).textTheme.headline6,
                    )
                  ],
                ),
              ),
              PopupMenuItem(
                value: 2,
                child: Row(
                  children: [
                    Icon(Icons.lightbulb_outlined),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Overview",
                      style: Theme.of(context).textTheme.headline6,
                    )
                  ],
                ),
              ),
              PopupMenuItem(
                value: 3,
                child: Row(
                  children: [
                    Icon(Icons.analytics_outlined),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Performance",
                      style: Theme.of(context).textTheme.headline6,
                    )
                  ],
                ),
              ),
            ],
            offset: const Offset(0, 30),
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: const Icon(
                Icons.more_vert
              ),
            ),
          ):const SizedBox.shrink(),
          title: Text(
            widget.routine.title!,
            style: Theme.of(context).textTheme.headline4!.copyWith(
              color: widget.controller.frequencyColors[widget.routine.frequency]
            )
          ),
          subtitle: Text(
            '${widget.routine.description!} \n$timeDetails',
            style: Theme.of(context).textTheme.headline6!.copyWith(
              color: grey,
              height: 1.5
            ),
          ),
          trailing: widget.isList?null: GestureDetector(
            onTap: () => widget.controller.updateRoutine(widget.routine),
            child: CircleAvatar(
              radius: Dimensions.basePadding*1.2,
              backgroundColor: widget.routine.status==-1?backgroundAccent:green.withOpacity(.1),
              child: widget.routine.status==-1? const SizedBox.shrink():
              Icon(
                widget.routine.status==0?Icons.block: Icons.check,
                color: widget.routine.status==0? dark: green,
              ),
            ),
          ),
          isThreeLine: true,
        ),
        const SizedBox(height: 2,)
      ],
    );
  }
}
