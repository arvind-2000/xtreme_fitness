import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/controller/authcontroller.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/addmembersscreen.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/addstaffscreen.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/addtrainer/addtrainerscreen.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/allpaymentts.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/analyticsscreen.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/dashboardresponsive/dashboardscreen1.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/messagescreen.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/plansscreen.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/renewalscreen.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/servicescreen.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/settingscreen.dart';
import 'package:xtreme_fitness/widgets/navbarmember.dart';

import '../../../widgets/navbar.dart';
import '../controllers/pagecontroller.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetxAuthController>(builder: (authctrl) {
      return GetBuilder<GetxPageController>(builder: (pagectrl) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //  SizedBox(height:    MediaQuery.sizeOf(context).width < 800?0:100,),
            Expanded(
              child: Row(
                children: [
                  MediaQuery.sizeOf(context).width < 800
                      ? const SizedBox()
                      : SizedBox(
                          width: MediaQuery.sizeOf(context).width < navbarsize
                              ? 100
                              : 250,
                          child: Row(
                            children: [
                              Expanded(
                                child: authctrl.ismember
                                    ? NavBarMember(
                                        pagectrl: pagectrl, authctrl: authctrl)
                                    : NavBar(
                                        pagectrl: pagectrl,
                                        authctrl: authctrl,
                                      ),
                              ),

                              //   Container(
                              //     width: 1,
                              //     height:double.maxFinite,
                              //         color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.5),
                              // ),
                            ],
                          ),
                        ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //  Container(
                        //   height: 0.5,
                        //   width:double.maxFinite,
                        //   color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
                        // ),
                        authctrl.ismember
                            ? Expanded(
                                child: pagectrl.navpage == 5
                                    ? const PlansScreen()
                                    : const ServicesScreen())
                            : Expanded(
                                child: pagectrl.navpage == 0
                                    ? const DashBoardScreen1()
                                    : pagectrl.navpage == 1
                                        ? const AnalyticsScreen()
                                        : pagectrl.navpage == 2
                                            ? AddMemberScreen()
                                            : pagectrl.navpage == 3
                                                ? const ServicesScreen()
                                                : pagectrl.navpage == 4
                                                    ? const AddStaffScreen()
                                                    : pagectrl.navpage == 5
                                                        ? const PlansScreen()
                                                        : pagectrl.navpage == 6
                                                            ? const RenewalScreen()
                                                            : pagectrl.navpage ==
                                                                    7
                                                                ? const AllPaymentScreen()
                                                                : pagectrl.navpage ==
                                                                        8
                                                                    ? SettingPage()
                                                                    : pagectrl.navpage ==
                                                                            10
                                                                        ? const AddTrainerScreen()
                                                                        : const MessagePage(),
                              )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      });
    });
  }
}

class NavTiles extends StatelessWidget {
  const NavTiles({
    super.key,
    required this.icon,
    required this.title,
  });
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 14,
          color: Theme.of(context).colorScheme.onSurface,
        ),
        const SizedBox(
          width: 20,
        ),
        MediaQuery.sizeOf(context).width < navbarsize &&
                MediaQuery.sizeOf(context).width > mobilescreen
            ? const SizedBox()
            : Text(
                title,
                // size: 16,
              ),
      ],
    );
  }
}
