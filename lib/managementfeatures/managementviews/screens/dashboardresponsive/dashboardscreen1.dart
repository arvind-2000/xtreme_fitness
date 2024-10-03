import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/managementcontroller.dart';

import 'dashboarddesktop.dart';
import 'dashboardmobile.dart';

class DashBoardScreen1 extends StatefulWidget {
  const DashBoardScreen1({super.key});

  @override
  State<DashBoardScreen1> createState() => _DashBoardScreen1State();
}

class _DashBoardScreen1State extends State<DashBoardScreen1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<ManagementController>().getxtremer();
    Get.find<ManagementController>().viewpayment();
    Get.find<ManagementController>().getpaymentlastest10();
    Get.find<ManagementController>().getAllServiceSchedules();
    Get.find<ManagementController>().getAllSubscriptions();
    Get.find<ManagementController>().getAllusers();
  }
  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.sizeOf(context).width;
    return size < 800
        ? const DashboardMobileScreen()
        : const DashboardDesktopScreen();
  }
}
