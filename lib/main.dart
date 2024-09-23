import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/pages/dialogs/mobile/logindialogmobile.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/pages/dialogs/mobile/loginscreen.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/pages/dialogs/mobile/signup.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/pages/otpform.dart';

import 'authenicationfeatures/views/controller/authcontroller.dart';
import 'config/scroll.dart';
import 'config/themes/themenew.dart';
import 'handlerpage.dart';
import 'landingpages/controllers/getxcontrol.dart';
import 'landingpages/sections/main/main_section.dart';
import 'managementfeatures/managementviews/controllers/pagecontroller.dart';

void main() async {
  runApp(const MyApp());
//  workerManager.log = true;
//   await workerManager.init();

  // setUrlStrategy(PathUrlStrategy());
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
      theme: ThemeData(
        colorScheme: darkColorSchemes,
        // scaffoldBackgroundColor: const Color.fromARGB(255, 24, 23, 23),
        scaffoldBackgroundColor: const Color.fromARGB(255, 15, 15, 15),
      ),
      // theme:lightThemes,
      // darkTheme: ThemeData(colorScheme: darkColorSchemes),
      debugShowCheckedModeBanner: false,

      initialRoute: '/',
      unknownRoute: GetPage(
        name: '/',
        page: () => MainPage(),
      ),
      getPages: [
        GetPage(
            name: '/dashboard',
            page: () => const HandlerPage(),
            transition: Transition.noTransition),

        GetPage(
            name: '/loginmobile',
            page: () => const LoginDialogMobile(),
            transition: Transition.noTransition),
        // GetPage(
        //     name: '/',
        //     page: () => const LandingHomePage(index: 4,),
        //     transition: Transition.noTransition),
        GetPage(
            name: '/home',
            page: () => const MainPage(),
            transition: Transition.noTransition),
        // GetPage(
        //     name: '/pricing',
        //     page: () => const LandingHomePage(
        //           index: 1,
        //         ),
        //     transition: Transition.noTransition),
        // GetPage(
        //     name: '/services',
        //     page: () => const LandingHomePage(
        //           index: 2,
        //         ),
        //     transition: Transition.noTransition),
        // GetPage(
        //     name: '/gallery',
        //     page: () => const LandingHomePage(
        //           index: 3,
        //         ),
        //     transition: Transition.noTransition),
        // GetPage(
        //     name: '/login',
        //     page: () => const AuthHandlerPage(
        //           index: 0,
        //         )),
        // GetPage(
        //     name: '/signup',
        //     page: () => const AuthHandlerPage(
        //           index: 1,
        //         )),
        // GetPage(
        //     name: '/forgotpassword',
        //     page: () => const AuthHandlerPage(
        //           index: 2,
        //         )),
      ],
    ).animate().fadeIn();
  }
}
