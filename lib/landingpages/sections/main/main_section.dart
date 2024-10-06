import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universal_html/html.dart';
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

    return StreamBuilder<NetworkState>(
      stream:
          networkController.networkStateStream, // Stream from NetworkController
      builder: (context, snapshot) {
        // Handle loading state if needed
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white70,
            ),
          );
        }

        // Check if the stream has data
        if (!snapshot.hasData) {
          return const Center(child: Text('Unexpected error occurred.'));
        }

        // Handle different network states
        switch (snapshot.data!) {
          case NetworkState.noInternet:
            return const NoInternetPage(); // Show no internet page

          case NetworkState.serverError:
            return const ServerErrorPage(); // Show server error page

          case NetworkState.dataFetched:
            return Scaffold(
              key: landctrl.key,
              backgroundColor: const Color.fromARGB(255, 15, 15, 15),
              drawer:
                  !Responsive.isDesktop(context) ? const MobileDrawer() : null,
              extendBodyBehindAppBar: true,
              body: RefreshIndicator(
                triggerMode: RefreshIndicatorTriggerMode.onEdge,
                color: Theme.of(context).colorScheme.secondary,
                onRefresh: () async {
                  // Trigger refresh logic
                  networkController.getContactDetails();
                },
                child: SafeArea(
                  child: Stack(
                    children: [
                      const Body(), // Main content
                      Responsive.isTablet(context) ||
                              Responsive.isMobile(context)
                          ? const NavBarMobile() // Mobile nav bar
                          : const NavbarDesktop(), // Desktop nav bar
                    ],
                  ),
                ),
              ),
            );

          default:
            return const Center(
                child: Text('Unknown state')); // Fallback for unknown states
        }
      },
    );
  }
}
