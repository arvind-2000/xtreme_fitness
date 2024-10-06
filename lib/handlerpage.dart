import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universal_html/html.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/controller/authcontroller.dart';
import 'package:xtreme_fitness/landingpages/pages/network/networkcontroller.dart';
import 'package:xtreme_fitness/landingpages/pages/network/nointernetpage.dart';
import 'package:xtreme_fitness/landingpages/pages/network/noserverpage.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/addmemberscontrol.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/managementcontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/pagecontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/dashboard.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/editcontactinfo/contactcontroller.dart';
import 'package:xtreme_fitness/responsive/responsive.dart';
import 'package:badges/badges.dart' as badges;
import 'dart:ui' as ui;
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
    Get.find<GetxAuthController>().authentications();

    authenticates();
  }

  void authenticates() async {
    await Get.find<GetxAuthController>().authenticationsforReload();
    Get.put(AddMemberController());
    Get.put(ManagementController());
    Get.find<ContactController>().getallmessage();
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
    final GetxAuthController authController = Get.find<GetxAuthController>();

    return Scaffold(
      body: StreamBuilder<NetworkState>(
        stream: networkController
            .networkStateStream.stream, // Stream from NetworkController
        builder: (context, snapshot) {
          // Display CircularProgressIndicator if the network call is in progress
          if (networkController.isWaiting.value) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white70,
              ),
            );
          }

          // Handle waiting state of the StreamBuilder itself
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white70,
              ),
            );
          }

          // Handle case where there is no data from the stream
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
              // Check if the authentication process is loading
              if (authController.isauthloading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white70,
                  ),
                );
              } else {
                // Proceed to dashboard once auth is done loading
                return HandlerToDashboard(refresh: authenticates);
              }

            default:
              return const Center(
                child: Text('Unknown state'),
              ); // Fallback for unknown states
          }
        },
      ),
    );
  }
}

class HandlerToDashboard extends StatelessWidget {
  const HandlerToDashboard({
    super.key,
    required this.refresh,
  });
  final ui.VoidCallback refresh;
  @override
  Widget build(BuildContext context) {
    final GetxPageController pagectrl = Get.find<GetxPageController>();
    return GetBuilder<ContactController>(builder: (conctrl) {
      return GetBuilder<GetxAuthController>(builder: (authctrl) {
        return GetBuilder<GetxPageController>(builder: (_) {
          return GetBuilder<ManagementController>(builder: (managectrl) {
            return RefreshIndicator(
              color: Theme.of(context).colorScheme.secondary,
              onRefresh: () async {
                managectrl.onInit();
                refresh();
              },
              child: Scaffold(
                appBar: Responsive.isMobile(context) ||
                        Responsive.isTablet(context)
                    ? AppBar(
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        // title: TitleText(pagectrl.navpage==0?"Overview":pagectrl.navpage==3?"Services":pagectrl.navpage==5?"Plans":pagectrl.navpage==10?"Trainer":pagectrl.navpage==4?"Staff":pagectrl.navpage==2?"Add Member":pagectrl.navpage==6?"Xtremers":pagectrl.navpage==7?"Payments":""),
                        centerTitle: true,
                        actions: [
                          authctrl.ismember
                              ? const SizedBox()
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
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
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        child: authctrl.ismember
                            ? NavBarMember(authctrl: authctrl)
                            : NavBar(
                                authctrl: authctrl,
                              ),
                      )
                    : null,
                body: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1900),
                    // authctrl.getuser==null? Center(child: CircularProgressIndicator(color: Colors.white,),):
                    // child: SafeArea(child: PaymentStatusCard(callback: (){}))),
                    child: const SafeArea(child: DashBoardScreen())),
              ),
            );
          });
        });
      });
    });
  }
}
