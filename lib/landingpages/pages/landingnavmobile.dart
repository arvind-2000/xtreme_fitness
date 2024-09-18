import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/card.dart';
import '../controllers/getxcontrol.dart';

class NavBarMobile extends StatelessWidget {
  const NavBarMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetxLandingcontroller>(builder: (landingctrl) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 70,
            child: Image.asset("assets/logo1.png"),
          ),
          const SizedBox(
            height: 80,
          ),
          Cardonly(
              margin: const EdgeInsets.symmetric(vertical: 8),
              color: Colors.transparent,
              onpress: () {
                landingctrl.changelandingpage(0);
                Get.toNamed("/home");
              },
              child: Text(
                "Home",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: landingctrl.page != 1 && landingctrl.page != 2
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context).colorScheme.onSecondary),
              )),
          Cardonly(
              margin: const EdgeInsets.symmetric(vertical: 8),
              color: Colors.transparent,
              onpress: () {
                landingctrl.changelandingpage(1);
                Get.toNamed("/pricing");
              },
              child: Text(
                "Pricing",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: landingctrl.page == 1
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context).colorScheme.onSecondary),
              )),
          Cardonly(
              margin: const EdgeInsets.symmetric(vertical: 8),
              color: Colors.transparent,
              onpress: () {
                landingctrl.changelandingpage(2);
                Get.toNamed("/services");
              },
              child: Text(
                "Services",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: landingctrl.page == 2
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context).colorScheme.onSecondary),
              )),
          Cardonly(
              margin: const EdgeInsets.symmetric(vertical: 8),
              color: Colors.transparent,
              onpress: () {
                landingctrl.changelandingpage(3);
                Get.toNamed("/gallery");
              },
              child: Text(
                "Gallery",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: landingctrl.page == 3
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context).colorScheme.onSecondary),
              )),
        ],
      );
    });
  }
}
