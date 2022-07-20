
import 'package:flutter/material.dart';
import 'package:routine/app/modules/home/controllers/home_controller.dart';
import 'package:routine/app/utils/color/color.dart';
import 'package:routine/app/utils/dimensions/dimensions.dart';

class RoutineCard extends StatefulWidget {
  const RoutineCard({
    Key? key,
    required this.controller,
    required this.colorIndex, required this.status,
  }) : super(key: key);

  final HomeController controller;
  final int colorIndex;
  final int status;

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
            'Read ahead for coding interview',
            style: Theme.of(context).textTheme.headline4!.copyWith(
              color: widget.controller.frequency[widget.colorIndex]
            )
          ),
          subtitle: Text(
            '21:20 * Hourly',
            style: Theme.of(context).textTheme.headline6!.copyWith(
              color: grey
            ),
          ),
          trailing: CircleAvatar(
            radius: Dimensions.basePadding*1.2,
            backgroundColor: widget.status==-3?backgroundAccent:green.withOpacity(.1),//green.withOpacity(.1),//backgroundAccent,
            child: Icon(
              widget.status==-3?Icons.block: Icons.check, //Icons.check //Icons.block
              color: widget.status==-3? dark: green,
            ),
          ),
        ),
        const SizedBox(height: 2,)
      ],
    );
  }
}
