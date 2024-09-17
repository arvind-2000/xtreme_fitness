import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/controller/authcontroller.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/pages/dialogs/logindialog.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/landingpages/controllers/getxcontrol.dart';
import 'package:xtreme_fitness/landingpages/widget/navbar_actions_button.dart';
import 'package:xtreme_fitness/widgets/card.dart';
import 'package:xtreme_fitness/widgets/cardborder.dart';
import 'package:xtreme_fitness/widgets/normaltext.dart';

import '../../widgets/cardswithshadow.dart';

class LandingNavBarItemsWidget extends StatelessWidget {
  const LandingNavBarItemsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetxLandingcontroller>(builder: (landingctrl) {
      return GetBuilder<GetxAuthController>(builder: (authctrl) {
        return SizedBox(
          height: MediaQuery.of(context).size.height + 100,
          child: Column(
            children: [
              Container(
                height: 80,
                color: const Color.fromARGB(255, 6, 6, 6),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 50,
                          ),
                          Row(
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

                              ...navItems.asMap().entries.map(
                                    (e) => NavBarActionButton(
                                      label: e.value,
                                      index: e.key,
                                    ),
                                  ),
                              // Row(
                              //   children: navItems.map((item) {
                              //     int index = navItems.indexOf(item);
                              //     return Cardonly(
                              //       color: Colors.transparent,
                              //       onpress: () {
                              //         landingctrl.setnavindex(index);
                              //         log(index.toString());
                              //         landingctrl.scroll(index);
                              //       },
                              //       child: NormalText(
                              //         text: item,
                              //         size: 16,
                              //       ),
                              //     );
                              //   }).toList(),
                              // )
                            ],
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Row(
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
                            ),
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
            ],
          ),
        );
      });
    });
  }
}
