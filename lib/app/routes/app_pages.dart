import 'package:get/get.dart';
import 'package:routine/app/modules/routine/views/routine_create_view.dart';
import 'package:routine/app/modules/routine/views/routine_edit_view.dart';
import 'package:routine/app/modules/routine/views/routine_performance_view.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/routine/bindings/routine_binding.dart';
import '../modules/routine/views/routine_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ROUTINE,
      page: () => const RoutineView(),
      binding: RoutineBinding(),
    ),
    GetPage(
      name: _Paths.CREATE,
      page: () => const RoutineCreateView(),
      binding: RoutineBinding(),
    ),
    GetPage(
      name: _Paths.EDIT,
      page: () => const RoutineEditView(),
      binding: RoutineBinding(),
    ),
    GetPage(
      name: _Paths.PERFORMANCE,
      page: () => const RoutinePerformanceView(),
      binding: RoutineBinding(),
    ),
  ];
}
