import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/pages/dialogs/mobile/logindialogmobile.dart';
import 'package:xtreme_fitness/landingpages/sections/policies.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/addmemberfields/paymentredirectpage.dart';

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
      theme: ThemeData(
        colorScheme: darkColorSchemes,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.white, // Cursor color
          selectionColor:
              Colors.blue.withOpacity(0.3), // Selection highlight color
          selectionHandleColor:
              Colors.grey.withOpacity(0.3), // Selection handle color
        ),
        // scaffoldBackgroundColor: const Color.fromARGB(255, 24, 23, 23),
        scaffoldBackgroundColor: const Color.fromARGB(255, 15, 15, 15),
      ),
      // theme:lightThemes,
      // darkTheme: ThemeData(colorScheme: darkColorSchemes),
      debugShowCheckedModeBanner: false,

      initialRoute: '/',
      unknownRoute: GetPage(
        name: '/',
        page: () => const MainPage(),
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

        GetPage(
            name: '/createmember',
            page: () => const PaymentRedirectPage(),
            transition: Transition.noTransition),
        GetPage(
            name: '/Policies',
            page: () => const Policies(),
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
