import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/controller/authcontroller.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/landingpages/controllers/getxcontrol.dart';
import 'package:xtreme_fitness/landingpages/pages/notfoundpages/notfoundpage.dart';
import 'package:xtreme_fitness/landingpages/pages/servicespage.dart';
import 'package:xtreme_fitness/widgets/cardborder.dart';
import 'dart:html' as html;

import '../../widgets/card.dart';
import '../../widgets/cardswithshadow.dart';

import 'gallery.dart';
import 'landingnavbarpage.dart';
import 'landingpage.dart';
import 'pricingpage.dart';

class LandingHomePage extends StatefulWidget {
  const LandingHomePage({super.key, this.index});
  final int? index;

  @override
  State<LandingHomePage> createState() => _LandingHomePageState();
}

class _LandingHomePageState extends State<LandingHomePage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Get.find<GetxLandingcontroller>().onInit();
        if (widget.index != null) {
          Get.find<GetxLandingcontroller>().changelandingpage(widget.index!);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context).width;

    return GetBuilder<GetxAuthController>(builder: (authctrl) {
      return GetBuilder<GetxLandingcontroller>(builder: (landingctrl) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 15, 15, 15),
          appBar: size > 1000
              ? null
              : AppBar(
                  // title:SizedBox(
                  //   height: 50,
                  //   width: 50,
                  //   child: Image.asset('assets/logo1.png',fit: BoxFit.contain,)),
                  backgroundColor: Colors.black87,
                  actions: [
                    CardBorder(
                      onpress: () {
                        authctrl.changeAuthPage(0);
                        Get.toNamed("/login");
                      },
                      margin: const EdgeInsets.all(4),
                      color: Colors.red[800],
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          "Log In",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.red[800],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CardwithShadow(
                      onpress: () {
                        authctrl.changeAuthPage(0);
                        Get.toNamed("/signup");
                      },
                      color: Colors.red[800],
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 8),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
          drawer: Drawer(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 70,
                    child: Image.asset("assets/logo1.png"),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Cardonly(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      color: landingctrl.page != 1 && landingctrl.page != 2
                          ? Theme.of(context).colorScheme.secondary
                          : Colors.transparent,
                      onpress: () {
                        landingctrl.changelandingpage(1);
                        Get.toNamed("/home");
                      },
                      child: Text(
                        "Home",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSecondary),
                      )),
                  Cardonly(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      color: landingctrl.page == 1
                          ? Theme.of(context).colorScheme.secondary
                          : Colors.transparent,
                      onpress: () {
                        landingctrl.changelandingpage(1);
                        Get.toNamed("/pricing");
                      },
                      child: Text(
                        "Pricing",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSecondary),
                      )),
                  Cardonly(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      color: landingctrl.page == 2
                          ? Theme.of(context).colorScheme.secondary
                          : Colors.transparent,
                      onpress: () {
                        landingctrl.changelandingpage(2);
                        Get.toNamed("/services");
                      },
                      child: Text(
                        "Services",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSecondary),
                      )),
                  Cardonly(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      color: landingctrl.page == 2
                          ? Theme.of(context).colorScheme.secondary
                          : Colors.transparent,
                      onpress: () {
                        landingctrl.changelandingpage(2);
                        Get.toNamed("/services");
                      },
                      child: Text(
                        "Gallery",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSecondary),
                      )),
                ],
              ),
            ),
          ),
          body: SafeArea(
              child: RefreshIndicator(
            backgroundColor: Colors.transparent,
            color: Theme.of(context).colorScheme.secondary,
            onRefresh: () async {
              html.window.location.reload();
              // landingctrl.onInit();
            },
            child: const SingleChildScrollView(

                // child: Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     //navbar
                //     size<=1000?const SizedBox():   const LandingNavBar(),
                //     //body
                //     landingctrl.page == 2?const ServicePage():
                //     landingctrl.page == 3?const GalleryPage():
                //     landingctrl.page == 1? const PricingPage():
                //     landingctrl.page == 0? const LandingPage():
                //     NotfoundPage()

                //     // ContactFooter()
                //     // Footer()

                //   ],
                // ),
                ),
          )).animate().fadeIn(),
        );
      });
    });
  }
}
