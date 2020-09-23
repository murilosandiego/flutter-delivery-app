import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:delivery_app_getx/core/routes/pages.dart';
import 'package:delivery_app_getx/core/routes/routers.dart';
import 'package:delivery_app_getx/core/themes/themes.dart';

import 'core/routes/bindings/initial_binding.dart';

void main() async {
  await GetStorage.init();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      smartManagement: SmartManagement.full,
      initialBinding: InitialBinding(),
      debugShowCheckedModeBanner: false,
      title: 'Ponte Delivery',
      initialRoute: Routers.home,
      getPages: Pages.getPages,
      theme: Themes.light,
    );
  }
}
