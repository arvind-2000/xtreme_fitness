import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/managementcontroller.dart';

import 'dashboarddesktop.dart';
import 'dashboardmobile.dart';

class DashBoardScreen1 extends StatelessWidget {
  const DashBoardScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<ManagementController>().viewpayment();
    final double size = MediaQuery.sizeOf(context).width;
    return size < 800
        ? const DashboardMobileScreen()
        : const DashboardDesktopScreen();
  }
}
