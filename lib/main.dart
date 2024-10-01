import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/landingpages/pages/notfoundpages/notfoundpage.dart';
import 'package:xtreme_fitness/landingpages/sections/policies.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/addmemberfields/paymentredirectpage.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/editcontactinfo/contactcontroller.dart';

import 'authenicationfeatures/views/controller/authcontroller.dart';
import 'config/scroll.dart';
import 'config/themes/themenew.dart';
import 'handlerpage.dart';
import 'landingpages/controllers/getxcontrol.dart';
import 'landingpages/sections/main/main_section.dart';
import 'managementfeatures/managementviews/controllers/pagecontroller.dart';
import 'dart:html' as html;

import 'managementfeatures/managementviews/screens/editcontactinfo/contactcontroller.dart';
void main() async {
  runApp(const MyApp());
  setUrlStrategy(PathUrlStrategy());
  Get.put(GetxPageController());
  Get.put(GetxAuthController()).authentications();
  Get.put(ContactController());
  Get.put(GetxLandingcontroller()).onInit();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scrollBehavior: CustomScrollBehavior(),
      title: 'Xtreme Fitness',
      theme: ThemeData(
        colorScheme: darkColorSchemes,
        scrollbarTheme: ScrollbarThemeData(
          trackBorderColor:
              WidgetStateProperty.all(Colors.red.withOpacity(0.6)),
          trackColor: WidgetStateProperty.all(Colors.red.withOpacity(0.6)),
          thumbColor: WidgetStateProperty.all(
              Colors.red.withOpacity(0.6)), // Scrollbar color
          radius: const Radius.circular(4),
          thickness: WidgetStateProperty.all(3),
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.white, // Cursor color
          selectionColor:
              Colors.blue.withOpacity(0.3), // Selection highlight color
          selectionHandleColor:
              Colors.grey.withOpacity(0.3), // Selection handle color
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 15, 15, 15),
      ),
      // theme:lightThemes,
      // darkTheme: ThemeData(colorScheme: darkColorSchemes),
      debugShowCheckedModeBanner: false,

      initialRoute: '/',
      unknownRoute: GetPage(
        name: '/NotFoundPage',
        page: () => const NotfoundPage(),
      ),
      getPages: [
        GetPage(
            name: '/dashboard',
            page: () => const HandlerPage(),
            transition: Transition.noTransition),
        GetPage(
            name: '/home',
            page: () => const MainPage(),
            transition: Transition.noTransition),
        GetPage(
            name: '/',
            page: () => const MainPage(),
            transition: Transition.noTransition),
        GetPage(
            name: '/createmember',
            page: () => const PaymentRedirectPage(),
            transition: Transition.noTransition),
        GetPage(
            name: '/Policies',
            page: () => const Policies(),
            transition: Transition.noTransition),
      ],
    ).animate().fadeIn();
  }
}
