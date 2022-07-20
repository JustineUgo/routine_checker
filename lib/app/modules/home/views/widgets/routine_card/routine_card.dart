
import 'package:flutter/material.dart';
import 'package:routine/app/custom/models/routine.dart';
import 'package:routine/app/modules/home/controllers/home_controller.dart';
import 'package:routine/app/utils/color/color.dart';
import 'package:routine/app/utils/dimensions/dimensions.dart';

class RoutineCard extends StatefulWidget {
  const RoutineCard({
    Key? key,
    required this.controller, required this.routine,
  }) : super(key: key);

  final HomeController controller;
  final Routine routine;

  @override
  State<RoutineCard> createState() => _RoutineCardState();
}

class _RoutineCardState extends State<RoutineCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          minLeadingWidth: 0,
          tileColor: backgroundSecondary,
          leading: PopupMenuButton<int>(
            padding: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: const Icon(
                Icons.more_vert
              ),
            ),
            itemBuilder: (context) => [
              // popupmenu item 1
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
          ),
          title: Text(
            widget.routine.title!,
            style: Theme.of(context).textTheme.headline4!.copyWith(
              color: widget.controller.frequencyColors[widget.routine.frequency]
            )
          ),
          subtitle: Text(
            '${widget.routine.description!} \n${widget.routine.time!.hour}:${widget.routine.time!.minute} * ${widget.routine.frequency}',
            style: Theme.of(context).textTheme.headline6!.copyWith(
              color: grey,
              height: 1.5
            ),
          ),
          trailing: CircleAvatar(
            radius: Dimensions.basePadding*1.2,
            backgroundColor: widget.routine.status==-1?backgroundAccent:green.withOpacity(.1),
            child: widget.routine.status==-1? const SizedBox.shrink():
            Icon(
              widget.routine.status==0?Icons.block: Icons.check,
              color: widget.routine.status==0? dark: green,
            ),
          ),
          isThreeLine: true,
        ),
        const SizedBox(height: 2,)
      ],
    );
  }
}
