import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/landingpages/controllers/getxcontrol.dart';
import 'package:xtreme_fitness/landingpages/sections/main/main_section.dart';
import 'package:xtreme_fitness/landingpages/sections/main/widgets/_body.dart';
import 'package:xtreme_fitness/landingpages/sections/main/widgets/_mobile_drawer.dart';
import 'package:xtreme_fitness/landingpages/sections/main/widgets/_navbar_desktop.dart';
import 'package:xtreme_fitness/landingpages/sections/main/widgets/_navbar_mobile.dart';
import 'package:xtreme_fitness/responsive/responsive.dart';
import 'package:xtreme_fitness/widgets/cardborder.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    GetxLandingcontroller landctrl = Get.put(GetxLandingcontroller());
    return Scaffold(
      key: landctrl.key,
      backgroundColor: const Color.fromARGB(255, 15, 15, 15),
      drawer: !Responsive.isDesktop(context) ? const MobileDrawer() : null,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Stack(
          children: [
            const Body(),
            Responsive.isTablet(context) || Responsive.isMobile(context)
                ? const NavBarMobile()
                : const NavbarDesktop(),
          ],
        ),
      ),
    );
  }
}