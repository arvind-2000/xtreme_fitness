import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/pages/AuthHandlerPage.dart';
import 'package:xtreme_fitness/landingpages/pages/homepage.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'authenicationfeatures/views/controller/authcontroller.dart';
import 'config/themes/themenew.dart';
import 'handlerpage.dart';
import 'landingpages/controllers/getxcontrol.dart';
import 'landingpages/pages/landingpage.dart';
import 'managementfeatures/managementviews/controllers/pagecontroller.dart';
import 'dart:html' as html;
void main() async{
  runApp(const MyApp());
//  workerManager.log = true;
//   await workerManager.init();

    setUrlStrategy(PathUrlStrategy());
    Get.put(GetxPageController());
    Get.put(GetxAuthController());

    Get.put(GetxLandingcontroller()).onInit();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scrollBehavior: CustomScrollBehavior(),
      title: 'Xtreme Fitness',
      theme: ThemeData(colorScheme: darkColorSchemes,
      scaffoldBackgroundColor: Color.fromARGB(255, 24, 23, 23),
      ),
      // theme:lightThemes,
      // darkTheme: ThemeData(colorScheme: darkColorSchemes),
      debugShowCheckedModeBanner: false,


       initialRoute: '/home',
      getPages: [

        // GetPage(name: '/', page: () => const LandingHomePage(index: 0,),transition: Transition.noTransition),
        GetPage(name: '/', page: () => const HandlerPage(),transition: Transition.noTransition),
        GetPage(name: '/home', page: () => const LandingHomePage(index: 0,),transition: Transition.noTransition),
        GetPage(name: '/pricing', page: () => const LandingHomePage(index: 1,),transition: Transition.noTransition),
        GetPage(name: '/services', page: () => const LandingHomePage(index: 2,),transition: Transition.noTransition),
        GetPage(name: '/gallery', page: () => const LandingHomePage(index: 3,),transition: Transition.noTransition),
  

      GetPage(name: '/login', page: () => const AuthHandlerPage(index: 0,)),
      GetPage(name: '/signup', page: () => const AuthHandlerPage(index: 1,)),
      GetPage(name: '/forgotpassword', page: () => const AuthHandlerPage(index: 2,)),
      ],
    );
  }
}
