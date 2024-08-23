import 'package:flutter/material.dart';

import 'dashboardresponsive/dashboarddesktop.dart';
import 'dashboardresponsive/dashboardmobile.dart';


class DashBoardScreen1 extends StatelessWidget {
  const DashBoardScreen1({super.key});
  
  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.sizeOf(context).width;
    return size<800?const DashboardMobileScreen(): const DashboardDesktopScreen();
  }
}






