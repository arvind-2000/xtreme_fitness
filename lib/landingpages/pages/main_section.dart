import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/landingpages/controllers/getxcontrol.dart';

import 'package:xtreme_fitness/landingpages/pages/landingpage.dart';
import 'package:xtreme_fitness/landingpages/widget/landingnavbarwidget.dart';
import 'package:xtreme_fitness/responsive/responsive.dart';
import 'package:xtreme_fitness/widgets/card.dart';
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
    final size = MediaQuery.sizeOf(context).width;
    GetxLandingcontroller landingcontroller = Get.put(GetxLandingcontroller());

    return GetBuilder<GetxLandingcontroller>(builder: (_) {
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
                      // authctrl.changeAuthPage(0);
                      // Get.toNamed("/login");
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
                      // authctrl.changeAuthPage(0);
                      // Get.toNamed("/signup");
                    },
                    color: Colors.red[800],
                    padding:
                        const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
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
        drawer: GetBuilder<GetxLandingcontroller>(builder: (_) {
          return Drawer(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: SizedBox(
                      height: 70,
                      child: Image.asset(height: 50, "assets/logo2.png"),
                    ),
                  ),
                  const Divider(),
                  ...navItems.asMap().entries.map((e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          tileColor: landingcontroller.navindex == e.key
                              ? Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.6)
                              : Colors.transparent,
                          onTap: () {
                            landingcontroller.setnavindex(e.key);
                            landingcontroller.scroll(e.key, isMobile: true);
                            Navigator.pop(context);
                          },
                          // leading: Icon(
                          //   NavBarUtils.icons[e.key],
                          //   color: AppTheme.c!.primary,
                          // ),
                          title: Text(
                            e.value,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color:
                                    Theme.of(context).colorScheme.onSecondary),
                          ),
                        ),
                      )),

                  // Expanded(
                  //   child: ListView.builder(
                  //       itemCount: navItems.length,
                  //       shrinkWrap: true,
                  //       itemBuilder: (context, i) {
                  //         return
                  //       }),
                  // )

                  // Cardonly(
                  //     margin: const EdgeInsets.symmetric(vertical: 8),
                  //     color: landingcontroller.navindex == 0
                  //         ? Theme.of(context).colorScheme.secondary
                  //         : Colors.transparent,
                  //     onpress: () {
                  //       landingcontroller.setnavindex(0);

                  //       landingcontroller.scroll(0, isMobile: true);
                  //       Navigator.of(context).pop();
                  //     },
                  //     child: Text(
                  //       "Home",
                  //       style: TextStyle(
                  //           fontSize: 14,
                  //           fontWeight: FontWeight.bold,
                  //           color: Theme.of(context).colorScheme.onSecondary),
                  //     )),
                  // Cardonly(
                  //     margin: const EdgeInsets.symmetric(vertical: 8),
                  //     color: landingcontroller.navindex == 1
                  //         ? Theme.of(context).colorScheme.secondary
                  //         : Colors.transparent,
                  //     onpress: () {
                  //       landingcontroller.setnavindex(1);

                  //       landingcontroller.scroll(1, isMobile: true);
                  //       Navigator.of(context).pop();
                  //     },
                  //     child: Text(
                  //       "Pricing",
                  //       style: TextStyle(
                  //           fontSize: 14,
                  //           fontWeight: FontWeight.bold,
                  //           color: Theme.of(context).colorScheme.onSecondary),
                  //     )),
                  // Cardonly(
                  //     margin: const EdgeInsets.symmetric(vertical: 8),
                  //     color: landingcontroller.navindex == 2
                  //         ? Theme.of(context).colorScheme.secondary
                  //         : Colors.transparent,
                  //     onpress: () {
                  //       landingcontroller.setnavindex(2);

                  //       landingcontroller.scroll(2, isMobile: true);
                  //       Navigator.of(context).pop();
                  //     },
                  //     child: Text(
                  //       "Services",
                  //       style: TextStyle(
                  //           fontSize: 14,
                  //           fontWeight: FontWeight.bold,
                  //           color: Theme.of(context).colorScheme.onSecondary),
                  //     )),
                  // Cardonly(
                  //     margin: const EdgeInsets.symmetric(vertical: 8),
                  //     color: landingcontroller.navindex == 3
                  //         ? Theme.of(context).colorScheme.secondary
                  //         : Colors.transparent,
                  //     onpress: () {
                  //       landingcontroller.setnavindex(3);

                  //       landingcontroller.scroll(3, isMobile: true);
                  //       Navigator.of(context).pop();
                  //     },
                  //     child: Text(
                  //       "Contact",
                  //       style: TextStyle(
                  //           fontSize: 14,
                  //           fontWeight: FontWeight.bold,
                  //           color: Theme.of(context).colorScheme.onSecondary),
                  //     )),
                ],
              ),
            ),
          );
        }),
        extendBodyBehindAppBar: true,
        body: SafeArea(
          child: Stack(
            children: [
              const LandingPage(),
              Responsive.isTablet(context) || Responsive.isMobile(context)
                  ? const SizedBox()
                  : const LandingNavBarItemsWidget(),
            ],
          ),
        ),
      );
    });
  }
}

// class _NavBarTablet extends StatelessWidget {
//   const _NavBarTablet();

//   @override
//   Widget build(BuildContext context) {
//     GetxLandingcontroller landingcontroller = Get.put(GetxLandingcontroller());

//     return Padding(
//       padding: const EdgeInsets.all(8),
//       child: Row(
//         children: [
//           IconButton(
//             highlightColor: Colors.white54,
//             onPressed: () {
//               landingcontroller.key.currentState!.openDrawer();
//             },
//             icon: const Icon(
//               Icons.menu,
//             ),
//           ),

//           // Responsive.isMobile(context) ? const SizedBox() : const NavBarLogo(),
//           // Space.x1!,
//         ],
//       ),
//     );
//   }
// }
