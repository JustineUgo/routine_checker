
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routine/app/utils/color/color.dart';
import 'package:routine/app/utils/dimensions/dimensions.dart';

class DateTimeline extends StatefulWidget {
  const DateTimeline({
    Key? key,
  }) : super(key: key);

  @override
  State<DateTimeline> createState() => _DateTimelineState();
}

class _DateTimelineState extends State<DateTimeline> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8,),
        SizedBox(
          height: 50,
          width: Get.width,
          child: Column(
            children: [
                Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 30,
                  itemBuilder: (context, index){
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: Dimensions.basePadding/2),
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.basePadding, 
                        vertical: Dimensions.basePadding/2
                      ),
                      decoration: BoxDecoration(
                        color: orange,
                        borderRadius: BorderRadius.all(Radius.circular(Dimensions.borderRadius))
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Tue',
                            style: Theme.of(context).textTheme.headline6!.copyWith(
                              fontSize: 10, color: grey
                            ),
                          ),
                          Text(
                            '19',
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ],
                      ),
                    );
                  }
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8,),
        Divider(),
      ],
    );
  }
}