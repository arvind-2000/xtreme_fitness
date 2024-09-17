import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/pages/dialogs/logindialog.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/widgets/card.dart';
import 'package:xtreme_fitness/widgets/normaltext.dart';

import '../../authenicationfeatures/views/controller/authcontroller.dart';
import '../../widgets/cardborder.dart';
import '../../widgets/cardswithshadow.dart';
import '../controllers/getxcontrol.dart';

class LandingNavBarnew extends StatelessWidget {
  LandingNavBarnew({
    super.key,
  });
  final PageController _pageController = PageController();

  void _scrollToPage(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetxLandingcontroller>(builder: (landingctrl) {
      return GetBuilder<GetxAuthController>(builder: (authctrl) {
        return SizedBox(
          height: MediaQuery.of(context).size.height + 100,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 80,
                  color: const Color.fromARGB(255, 6, 6, 6),
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 100,
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      landingctrl.changelandingpage(0);
                                      Get.toNamed("/home");
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16.0),
                                      child: Image.asset("assets/logo2.png"),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 50,
                                  ),
                                  Row(
                                    children: navItems.map((item) {
                                      int index = navItems.indexOf(item);
                                      return Cardonly(
                                        color: Colors.transparent,
                                        onpress: () {
                                          // landingctrl.changelandingpage(2);
                                          // Get.toNamed("/services");
                                          _scrollToPage(index);
                                        },
                                        child: NormalText(
                                          text: item,
                                          size: 16,
                                        ),
                                      );

                                      // TextButton(
                                      //   onPressed: () {
                                      //     _scrollToPage(index);
                                      //   },
                                      //   child: Text(
                                      //     item,
                                      //     style: const TextStyle(
                                      //         color: Colors.white),
                                      //   ),
                                      // );
                                    }).toList(),
                                  )
                                  // Cardonly(
                                  //   color: Colors.transparent,
                                  //   onpress: () {
                                  //     landingctrl.changelandingpage(1);
                                  //     Get.toNamed("/pricing");
                                  //   },
                                  //   child: NormalText(
                                  //       text: "Pricing",
                                  //       size: 16,
                                  //       color: landingctrl.page == 1
                                  //           ? Theme.of(context)
                                  //               .colorScheme
                                  //               .secondary
                                  //           : null),
                                  // ),
                                  // const SizedBox(
                                  //   width: 20,
                                  // ),
                                  // Cardonly(
                                  //   color: Colors.transparent,
                                  //   onpress: () {
                                  //     landingctrl.changelandingpage(2);
                                  //     Get.toNamed("/services");
                                  //   },
                                  //   child: NormalText(
                                  //       text: "Services",
                                  //       size: 16,
                                  //       color: landingctrl.page == 2
                                  //           ? Theme.of(context)
                                  //               .colorScheme
                                  //               .secondary
                                  //           : null),
                                  // ),
                                  // const SizedBox(
                                  //   width: 20,
                                  // ),
                                  // Cardonly(
                                  //   color: Colors.transparent,
                                  //   onpress: () {
                                  //     landingctrl.changelandingpage(3);
                                  //     Get.toNamed("/gallery");
                                  //   },
                                  //   child: NormalText(
                                  //       text: "Gallery",
                                  //       size: 16,
                                  //       color: landingctrl.page == 3
                                  //           ? Theme.of(context)
                                  //               .colorScheme
                                  //               .secondary
                                  //           : null),
                                  // ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CardBorder(
                                  padding: EdgeInsets.zero,
                                  onpress: () {
                                    Get.dialog(
                                        barrierDismissible: false,
                                        const LoginDialog(
                                          signupdialog: false,
                                        ));

                                    // authctrl.changeAuthPage(0);
                                    // Get.toNamed("/login");
                                  },
                                  color: Colors.red[800],
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 32, vertical: 8),
                                    child: Text(
                                      "Log In",
                                      style: TextStyle(
                                        fontSize: 14,
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
                                    Get.dialog(
                                      barrierDismissible: false,
                                      const LoginDialog(
                                        signupdialog: true,
                                      ),
                                    );
                                    // authctrl.changeAuthPage(1);
                                    // Get.toNamed("/signup");
                                  },
                                  color: Colors.red[800],
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 32, vertical: 8),
                                  child: const Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 100,
                            ),
                          ],
                        ),
                      ),
                      // Divider(
                      //   height: 1,
                      //   color: Colors.grey[300],
                      // )
                    ],
                  ),
                ),
              ),
              // Expanded(
              //     flex: 14,
              //     child: LandingPage(
              //       pgctrl: _pageController,
              //     ))
            ],
          ),
        );
      });
    });
  }
}
