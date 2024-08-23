import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/pages/AuthHandlerPage.dart';
import 'package:xtreme_fitness/config/themes/theme.dart';
import 'package:xtreme_fitness/handlerpage.dart';

import 'authenicationfeatures/views/controller/authcontroller.dart';
import 'managementfeatures/managementviews/controllers/pagecontroller.dart';

void main() {
  runApp(const MyApp());
    Get.put(GetxPageController());
    Get.put(GetxAuthController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Xtreme Fitness',
      theme:darkThemeData,
      home: const AuthHandlerPage(),
    );
  }
}
