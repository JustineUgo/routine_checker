import 'package:get/get.dart';

import 'package:routine/app/modules/home/controllers/routine_create_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RoutineCreateController>(
      () => RoutineCreateController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
