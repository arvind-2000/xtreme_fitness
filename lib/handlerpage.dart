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

    Get.put(GetxPageController());
    authenticates();
  }

  // Authentication logic refactored for better performance
  void authenticates() async {
    bool isAuthenticated = await Get.find<GetxAuthController>().authenticationsForReload();
    if (isAuthenticated) {
      Get.put(AddMemberController());
      Get.put(ManagementController());
    }
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

    return Obx(() {
      if (networkController.connectionStatus.value == ConnectivityResult.none) {
        return const NoInternetPage();
      } else if (networkController.hasServerError.value) {
        return const ServerErrorPage();
      } else {
        return _buildMainContent(context);
      }
    });
  }

  // Build the main content of the page based on authentication
  Widget _buildMainContent(BuildContext context) {
    final authCtrl = Get.find<GetxAuthController>();

    return authCtrl.isauthloading.value
        ? const Center(child: CircularProgressIndicator(color: Colors.white70))
        : HandlerToDashboard(refresh: authenticates);
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
    final GetxPageController pageCtrl = Get.find<GetxPageController>();
    final GetxAuthController authCtrl = Get.find<GetxAuthController>();

    return RefreshIndicator(
      color: Theme.of(context).colorScheme.secondary,
      onRefresh: () async {
        final manageCtrl = Get.find<ManagementController>();
        manageCtrl.onInit();
        refresh();
      },
      child: Scaffold(
        appBar: _buildAppBar(context, authCtrl, pageCtrl),
        drawer: _buildDrawer(context, authCtrl),
        body: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1900),
          child: const SafeArea(child: DashBoardScreen()),
        ),
      ),
    );
  }

  // Build the AppBar for mobile or tablet view
  AppBar? _buildAppBar(BuildContext context, GetxAuthController authCtrl, GetxPageController pageCtrl) {
    if (Responsive.isMobile(context) || Responsive.isTablet(context)) {
      return AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        centerTitle: true,
        actions: [
          _buildUnreadMessagesBadge(authCtrl, pageCtrl),
        ],
      );
    }
    return null; // No app bar for large screens (desktop)
  }

  // Build unread messages badge if applicable
  Widget _buildUnreadMessagesBadge(GetxAuthController authCtrl, GetxPageController pageCtrl) {
    final ContactController contactCtrl = Get.find<ContactController>();

    return authCtrl.ismember
        ? const SizedBox()
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: badges.Badge(
              position: badges.BadgePosition.topEnd(end: -13),
              showBadge: contactCtrl.unreadmessagelist.isNotEmpty,
              badgeContent: Text(contactCtrl.unreadmessagelist.length.toString()),
              child: MaterialButton(
                minWidth: 0,
                padding: EdgeInsets.zero,
                onPressed: () {
                  pageCtrl.changeNavPage(9);
                },
                child: const Icon(Icons.message),
              ),
            ),
          );
  }

  // Build the drawer for mobile or tablet view
  Drawer? _buildDrawer(BuildContext context, GetxAuthController authCtrl) {
    if (Responsive.isMobile(context) || Responsive.isTablet(context)) {
      return Drawer(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: authCtrl.ismember
            ? NavBarMember(authctrl: authCtrl)
            : NavBar(authctrl: authCtrl),
      );
    }
    return null; // No drawer for desktop view
  }
}
