import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/controller/authcontroller.dart';
import 'package:xtreme_fitness/landingpages/controllers/getxcontrol.dart';
import 'package:xtreme_fitness/landingpages/pages/network/networkcontroller.dart';
import 'package:xtreme_fitness/landingpages/pages/network/nointernetpage.dart';
import 'package:xtreme_fitness/landingpages/pages/network/noserverpage.dart';
import 'package:xtreme_fitness/landingpages/sections/main/widgets/_body.dart';
import 'package:xtreme_fitness/landingpages/sections/main/widgets/_mobile_drawer.dart';
import 'package:xtreme_fitness/landingpages/sections/main/widgets/_navbar_desktop.dart';
import 'package:xtreme_fitness/landingpages/sections/main/widgets/_navbar_mobile.dart';
import 'package:xtreme_fitness/responsive/responsive.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    Get.put(GetxAuthController()).homepage();
  }

  @override
  Widget build(BuildContext context) {
    GetxLandingcontroller landctrl = Get.put(GetxLandingcontroller());

    final NetworkController networkController = Get.find<NetworkController>();

    return GetBuilder<NetworkController>(builder: (_) {
      if (networkController.isWaiting) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.white54,
          ),
        );
      } else if (!networkController.isinternetok) {
        return const NoInternetPage();
      } else {
        if (!networkController.isserverok) {
          return ServerErrorPage(
            callback: networkController.getContactDetails,
          );
        }

        return Scaffold(
          key: landctrl.key,
          backgroundColor: const Color.fromARGB(255, 15, 15, 15),
          drawer: !Responsive.isDesktop(context) ? const MobileDrawer() : null,
          extendBodyBehindAppBar: true,
          body: RefreshIndicator(
            triggerMode: RefreshIndicatorTriggerMode.onEdge,
            color: Theme.of(context).colorScheme.secondary,
            onRefresh: () async {
              GetxLandingcontroller().onInit();
            },
            child: SafeArea(
              child: Stack(
                children: [
                  const Body(),
                  Responsive.isTablet(context) || Responsive.isMobile(context)
                      ? const NavBarMobile()
                      : const NavbarDesktop(),
                ],
              ),
            ),
          ),
        );
      }
    });
  }
}
