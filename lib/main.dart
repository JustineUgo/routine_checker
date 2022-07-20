import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:routine/app/utils/theme/theme.dart';

import 'app/routes/app_pages.dart';

void main() async{

  await GetStorage.init();

  runApp(
    GetMaterialApp(
      title: "Routine Checker",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: themeData()
    ),
  );
}
