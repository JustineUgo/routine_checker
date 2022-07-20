
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
          tileColor: backgroundSecondary,
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
            backgroundColor: widget.status==-3?backgroundAccent:red.withOpacity(.1),//green.withOpacity(.1),//backgroundAccent,
            child: Icon(
              widget.status==-3?Icons.block: Icons.close, //Icons.check //Icons.block
              color: widget.status==-3? dark: red,
            ),
          ),
        ),
        const SizedBox(height: 2,)
      ],
    );
  }
}
