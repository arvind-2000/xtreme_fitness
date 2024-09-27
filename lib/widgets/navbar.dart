import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/controller/authcontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/editcontactinfo/contactcontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/widgets/dialogswidget.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';

import '../config/const.dart';
import '../managementfeatures/managementviews/controllers/pagecontroller.dart';
import '../managementfeatures/managementviews/screens/dashboard.dart';
import 'card.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
    required this.pagectrl,
    required this.authctrl,
  });
  final GetxPageController pagectrl;
  final GetxAuthController authctrl;

  void drawers(BuildContext context) {
    if (Scaffold.of(context).isDrawerOpen) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    GetxPageController pagecontrl = Get.put(GetxPageController());
    ContactController contrl = Get.put(ContactController());
    return Container(
      // color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
      color: Theme.of(context).colorScheme.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              pagecontrl.changeNavPage(0);
            },
            child: SizedBox(
              height: 70,
              child: SizedBox(
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset("assets/logo2.png"),
                  )),
            ),
          ),
          Container(
            height: 0.5,
            width: double.maxFinite,
            color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.5),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Cardonly(
                      onpress: () {
                        if (MediaQuery.sizeOf(context).width < mobilescreen) {
                          drawers(context);
                        }
                        pagectrl.changeNavPage(0);
                      },
                      color: pagectrl.navpage == 0
                          ? Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.3)
                          : Colors.transparent,
                      margin: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 16),
                      child: const NavTiles(
                        icon: Icons.dashboard,
                        title: 'Dashboard',
                      )),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    height: 0.5,
                    width: double.maxFinite,
                    color: Theme.of(context)
                        .colorScheme
                        .onPrimary
                        .withOpacity(0.5),
                  ),
                  // Cardonly(
                  //     onpress: () {
                  //           if (MediaQuery.sizeOf(context).width < mobilescreen) {
                  //         drawers(context);
                  //       }
                  //       pagectrl.changeNavPage(1);
                  //     },
                  //     color: pagectrl.navpage == 1 ? Theme.of(context).colorScheme.secondary.withOpacity(0.3) : Colors.transparent,
                  //     margin:
                  //         const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  //     child: const NavTiles(
                  //       icon: Icons.analytics,
                  //       title: 'Analytics',
                  //     )),

                  Cardonly(
                      color: pagectrl.navpage == 3
                          ? Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.3)
                          : Colors.transparent,
                      onpress: () {
                        if (MediaQuery.sizeOf(context).width < mobilescreen) {
                          drawers(context);
                        }

                        pagectrl.changeNavPage(3);
                      },
                      margin: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 16),
                      child: const NavTiles(
                        icon: Icons.design_services,
                        title: 'Services',
                      )),

                  Cardonly(
                      color: pagectrl.navpage == 5
                          ? Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.3)
                          : Colors.transparent,
                      onpress: () {
                        if (MediaQuery.sizeOf(context).width < mobilescreen) {
                          drawers(context);
                        }

                        pagectrl.changeNavPage(5);
                      },
                      margin: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 16),
                      child: const NavTiles(
                        icon: Icons.design_services,
                        title: 'Plans',
                      )),
                  Container(
                    height: 0.5,
                    width: double.maxFinite,
                    color: Theme.of(context)
                        .colorScheme
                        .onPrimary
                        .withOpacity(0.3),
                  ),

                  Cardonly(
                      color: pagectrl.navpage == 10
                          ? Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.3)
                          : Colors.transparent,
                      onpress: () {
                        if (MediaQuery.sizeOf(context).width < mobilescreen) {
                          drawers(context);
                        }
                        pagectrl.changeNavPage(10);
                      },
                      margin: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 16),
                      child: const NavTiles(
                        icon: Icons.person_add,
                        title: 'Trainer',
                      )),

                  Cardonly(
                      color: pagectrl.navpage == 4
                          ? Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.3)
                          : Colors.transparent,
                      onpress: () {
                        if (MediaQuery.sizeOf(context).width < mobilescreen) {
                          drawers(context);
                        }
                        pagectrl.changeNavPage(4);
                      },
                      margin: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 16),
                      child: const NavTiles(
                        icon: Icons.person_add,
                        title: 'Staff',
                      )),

                  Container(
                    height: 0.5,
                    width: double.maxFinite,
                    color: Theme.of(context)
                        .colorScheme
                        .onPrimary
                        .withOpacity(0.5),
                  ),

                  Cardonly(
                      color: pagectrl.navpage == 2
                          ? Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.3)
                          : Colors.transparent,
                      onpress: () {
                        if (MediaQuery.sizeOf(context).width < mobilescreen) {
                          drawers(context);
                        }
                        pagectrl.changeNavPage(2);
                      },
                      margin: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 16),
                      child: const NavTiles(
                        icon: Icons.person_add,
                        title: 'Add Member',
                      )),
                  Cardonly(
                      color: pagectrl.navpage == 6
                          ? Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.3)
                          : Colors.transparent,
                      onpress: () {
                        if (MediaQuery.sizeOf(context).width < mobilescreen) {
                          drawers(context);
                        }

                        pagectrl.changeNavPage(6);
                      },
                      margin: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 16),
                      child: const NavTiles(
                        icon: Icons.person_2,
                        title: 'Xtremers',
                      )),

                  Cardonly(
                      color: pagectrl.navpage == 7
                          ? Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.3)
                          : Colors.transparent,
                      onpress: () {
                        if (MediaQuery.sizeOf(context).width < mobilescreen) {
                          drawers(context);
                        }

                        pagectrl.changeNavPage(7);
                      },
                      margin: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 16),
                      child: const NavTiles(
                        icon: Icons.payment,
                        title: 'Payments',
                      )),
                  Container(
                    height: 0.5,
                    width: double.maxFinite,
                    color: Theme.of(context)
                        .colorScheme
                        .onPrimary
                        .withOpacity(0.5),
                  ),
                  Cardonly(
                      color: pagectrl.navpage == 8
                          ? Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.3)
                          : Colors.transparent,
                      onpress: () {
                        if (MediaQuery.sizeOf(context).width < mobilescreen) {
                          drawers(context);
                        }

                        pagectrl.changeNavPage(8);
                      },
                      margin: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 16),
                      child: const NavTiles(
                        icon: Icons.settings,
                        title: 'Setting',
                      )),
                  Cardonly(
                      color: pagectrl.navpage == 9
                          ? Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.3)
                          : Colors.transparent,
                      onpress: () {
                        if (MediaQuery.sizeOf(context).width < mobilescreen) {
                          drawers(context);
                        }
                        contrl.onBadgeTap();
                        pagectrl.changeNavPage(9);
                      },
                      margin: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 16),
                      child: const Row(
                        children: [
                          NavTiles(
                            icon: Icons.message,
                            title: 'Message',
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '( 1 )',
                            style: TextStyle(color: Colors.red),
                          )
                        ],
                      )),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Cardonly(
              color: Colors.transparent,
              onpress: () {
                if (MediaQuery.sizeOf(context).width < mobilescreen) {
                  drawers(context);
                }
                showDialog(
                    context: context,
                    builder: (c) => PageDialog(
                        heights: 300,
                        no: () {
                          Navigator.pop(context);
                        },
                        yes: () {
                          authctrl.logout();
                          Get.offAllNamed('/home');
                        },
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.logout),
                                SizedBox(
                                  width: 5,
                                ),
                                HeadingText(
                                  "Log Out",
                                  size: 20,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Center(
                                child: Text(
                              "Are you sure you want to logout?\nPress yes to confirm",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ))
                          ],
                        )));
              },
              margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: const NavTiles(
                icon: Icons.logout,
                title: 'Log Out',
              )),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
