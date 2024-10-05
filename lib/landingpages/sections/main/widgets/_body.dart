import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:xtreme_fitness/landingpages/controllers/getxcontrol.dart';
import 'package:xtreme_fitness/landingpages/sections/contact/contactdesktop.dart';
import 'package:xtreme_fitness/landingpages/sections/gallery/gallerydesktop%20copy.dart';
import 'package:xtreme_fitness/landingpages/sections/home/homedesktop.dart';
import 'package:xtreme_fitness/landingpages/sections/prices/pricesdesktop.dart';
import 'package:xtreme_fitness/landingpages/sections/services/desktopservices.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    GetxLandingcontroller landctrl = Get.put(GetxLandingcontroller());
    landctrl.itemPositionsListener.itemPositions.addListener(
      () {
        landctrl.setNavIndex(context);
      },
    );
    return GetBuilder<GetxLandingcontroller>(builder: (_) {
      return Column(
        children: [
          // Display the current index
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: ScrollablePositionedList.builder(
              shrinkWrap: true,
              itemScrollController: landctrl.scrollControllers,
              itemPositionsListener: landctrl.itemPositionsListener,
              initialScrollIndex: 0,
              itemCount: 5,
              itemBuilder: (context, index) => index == 0
                  ? const HomeDesktop()
                  : index == 1
                      ? const Pricesdesktop()
                      : index == 2
                          ? const ServicesDesktop()
                          : index == 3
                              ? const GalleryDesktopCopy()
                              : const ContactDesktop(),
            ),
          ),
        ],
      );
    });
  }
}
