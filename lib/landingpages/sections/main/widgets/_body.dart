import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/landingpages/controllers/getxcontrol.dart';
import 'package:xtreme_fitness/landingpages/pages/pricingpage.dart';
import 'package:xtreme_fitness/landingpages/sections/home/home.dart';

import '../../contact/contact.dart';
import '../../gallery/gallery.dart';
import '../../prices/prices.dart';
import '../../services/services.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    log("Width :${MediaQuery.sizeOf(context).width}");
    GetxLandingcontroller landctrl = Get.put(GetxLandingcontroller());
    landctrl.controller.addListener(() {
      log('fdfdfd');
      landctrl.setNavIndex(context);
    });
    return PageView.builder(
      // physics: Responsive.isMobile(context) || Responsive.isTablet(context)
      //     ? const NeverScrollableScrollPhysics()
      //     : null,
      pageSnapping: false,
      scrollDirection: Axis.vertical,
      controller: landctrl.controller,
      itemCount: landingwidgets.length,
      itemBuilder: (context, index) => landingwidgets[index],
    );

;

  }
}
