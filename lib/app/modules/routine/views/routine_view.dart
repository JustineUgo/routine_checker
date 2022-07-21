import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/routine_controller.dart';

class RoutineView extends GetView<RoutineController> {
  const RoutineView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RoutineView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'RoutineView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
