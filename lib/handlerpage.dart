import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universal_html/html.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/controller/authcontroller.dart';
import 'package:xtreme_fitness/landingpages/pages/network/networkcontroller.dart';
import 'package:xtreme_fitness/landingpages/pages/network/nointernetpage.dart';
import 'package:xtreme_fitness/landingpages/pages/network/noserverpage.dart';
import 'dart:html' as html;
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/addmemberscontrol.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/managementcontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/pagecontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/dashboard.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/editcontactinfo/contactcontroller.dart';
import 'package:xtreme_fitness/responsive/responsive.dart';
import 'package:badges/badges.dart' as badges;

import 'widgets/navbar.dart';
import 'widgets/navbarmember.dart';

class HandlerPage extends StatefulWidget {
  const HandlerPage({super.key});

  @override
  State<HandlerPage> createState() => _HandlerPageState();
}

class _HandlerPageState extends State<HandlerPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Get.put(AddMemberController());
        Get.put(GetxPageController()).onInit();
        Get.put(ManagementController()).onInit();
        Get.put(ContactController()).getallmessage();
      },
    );

    Get.put(ManagementController()).checkmember();
  }

  @override
  void dispose() {
    Get.find<AddMemberController>().onClose();
    Get.find<GetxAuthController>().disposelogin();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final NetworkController networkController = Get.find<NetworkController>();

    return GetBuilder<ContactController>(builder: (conctrl) {
      return GetBuilder<GetxAuthController>(builder: (authctrl) {
        return GetBuilder<GetxPageController>(builder: (pagectrl) {
          return GetBuilder<ManagementController>(builder: (managectrl) {
            return Obx(() {
              if (networkController.connectionStatus.value ==
                  ConnectivityResult) {
                return const NoInternetPage();
              } else {
                if (networkController.hasServerError.value) {
                  return const ServerErrorPage();
                } else {
                  return Scaffold(
                    appBar: Responsive.isMobile(context) ||
                            Responsive.isTablet(context)
                        ? AppBar(
                            backgroundColor:
                                Theme.of(context).colorScheme.surface,
                            // title: TitleText(pagectrl.navpage==0?"Overview":pagectrl.navpage==3?"Services":pagectrl.navpage==5?"Plans":pagectrl.navpage==10?"Trainer":pagectrl.navpage==4?"Staff":pagectrl.navpage==2?"Add Member":pagectrl.navpage==6?"Xtremers":pagectrl.navpage==7?"Payments":""),
                            centerTitle: true,
                            actions: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: badges.Badge(
                                  position:
                                      badges.BadgePosition.topEnd(end: -13),
                                  showBadge:
                                      conctrl.unreadmessagelist.isNotEmpty
                                          ? true
                                          : false,
                                  onTap: () {
                                    // cntrl.onBadgeTap();
                                    pagectrl.changeNavPage(9);
                                  },
                                  badgeContent: Text(conctrl
                                      .unreadmessagelist.length
                                      .toString()),
                                  child: MaterialButton(
                                      minWidth: 0,
                                      padding: EdgeInsets.zero,
                                      hoverColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      onPressed: () {
                                        // cntrl.onBadgeTap();
                                        pagectrl.changeNavPage(9);
                                      },
                                      child: const Icon(Icons.message)),
                                ),
                              ),
                            ],
                          )
                        : null,
                    drawer: Responsive.isMobile(context) ||
                            Responsive.isTablet(context)
                        ? Drawer(
                            surfaceTintColor: Colors.transparent,
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            child: authctrl.ismember
                                ? NavBarMember(
                                    pagectrl: pagectrl, authctrl: authctrl)
                                : NavBar(
                                    pagectrl: pagectrl,
                                    authctrl: authctrl,
                                  ),
                          )
                        : null,
                    body: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1900),
                        // authctrl.getuser==null? Center(child: CircularProgressIndicator(color: Colors.white,),):
                        // child: SafeArea(child: PaymentStatusCard(callback: (){}))),
                        child: const SafeArea(child: DashBoardScreen())),
                  );
                }
              }
            });
          });
        });
      });
    });
  }
}
