
import 'package:flutter/material.dart';
import 'package:routine/app/utils/dimensions/dimensions.dart';

class Appbar extends StatefulWidget {
  const Appbar({
    Key? key, required this.day,
  }) : super(key: key);
  final String day;

  @override
  State<Appbar> createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.basePadding * 2, 
            vertical: Dimensions.basePadding
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Routine Checker',
                style: Theme.of(context).textTheme.headline1
              ),
              Text(
                widget.day,
                style: Theme.of(context).textTheme.headline2
              ),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
