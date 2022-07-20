
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routine/app/utils/color/color.dart';
import 'package:routine/app/utils/dimensions/dimensions.dart';

class Topbar extends StatefulWidget {
  const Topbar({
    Key? key, required this.day,
  }) : super(key: key);
  final String day;

  @override
  State<Topbar> createState() => _TopbarState();
}

class _TopbarState extends State<Topbar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Material(
              color: backgroundPrimary,
              child: InkWell(
                onTap: ()=> Get.back(),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.basePadding * 2, 
                    vertical: Dimensions.basePadding
                  ),
                  child: Icon(
                    Icons.chevron_left,
                    size: 20,
                  ),
                ),
              ),
            ),
            Text(
              widget.day,
              style: Theme.of(context).textTheme.headline2!.copyWith(color: orange)
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
