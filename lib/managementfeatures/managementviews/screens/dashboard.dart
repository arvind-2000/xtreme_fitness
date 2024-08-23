import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/controller/authcontroller.dart';
import 'package:xtreme_fitness/config/const.dart';
import '../controllers/pagecontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/addmembersscreen.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/analyticsscreen.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/dashboardscreen1.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/servicescreen.dart';


import '../../../widgets/navbar.dart';


class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetxAuthController>(
      builder: (authctrl) {
        return GetBuilder<GetxPageController>(builder: (pagectrl) {
          return Column(
            children: [
           SizedBox(height:    MediaQuery.sizeOf(context).width < 800?0:100,),
              Expanded(
                child: Row(
                  children: [
                    MediaQuery.sizeOf(context).width < 800
                        ? const SizedBox()
                        : SizedBox(
                            width:
                                MediaQuery.sizeOf(context).width < navbarsize ? 100 : 250,
                            child: NavBar(
                              pagectrl: pagectrl, authctrl: authctrl,
                            ),
                          ),
                    Expanded(child:pagectrl.navpage ==0?const DashBoardScreen1():pagectrl.navpage ==1?const AnalyticsScreen():pagectrl.navpage==2?const AddMemberScreen():const ServicesScreen())
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
