import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/controller/authcontroller.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/addmembersscreen.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/addstaffscreen.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/addtrainer/addtrainerscreen.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/analyticsscreen.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/dashboardresponsive/dashboardscreen1.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/allpaymentts.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/plansscreen.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/renewalscreen.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/servicescreen.dart';
import 'package:xtreme_fitness/widgets/cardborder.dart';
import 'package:xtreme_fitness/widgets/navbarmember.dart';
import 'package:xtreme_fitness/widgets/titletext.dart';

import '../../../widgets/navbar.dart';
import '../controllers/pagecontroller.dart';
import 'dashboardmemberpage/dashboard1.dart';

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
                        SizedBox(
                          height: 70,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const TitleText("Overview"),
                                Row(
                                  children: [
                                    CardBorder(
                                        child: Row(
                                      children: [
                                        Icon(Icons.person,
                                            size: 14,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurface),
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        Text(authctrl.getuser != null
                                            ? authctrl.getuser!.roleName ??
                                                "Member"
                                            : "Member"),
                                      ],
                                    ))
                                  ],
                                )
                              ],
                            ),
                          ),),
                                  //  Container(
          //   height: 0.5,
          //   width:double.maxFinite,
          //   color: Theme.of(context).colorScheme.secondary.withOpacity(0.3), 
          // ),
                   authctrl.ismember? Expanded(child:pagectrl.navpage == 3?ServicesScreen():PlansScreen()):Expanded(
                           child: pagectrl.navpage ==0? const DashBoardScreen1():pagectrl.navpage ==1?const AnalyticsScreen():pagectrl.navpage==2?AddMemberScreen():pagectrl.navpage==3?const ServicesScreen():pagectrl.navpage==4?const AddStaffScreen():pagectrl.navpage==5?const PlansScreen():pagectrl.navpage==6?const RenewalScreen():pagectrl.navpage==10?const AddTrainerScreen():const EditUserScreen(),
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
      }
    );
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
