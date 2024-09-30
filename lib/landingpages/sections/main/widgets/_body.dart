import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:xtreme_fitness/landingpages/controllers/getxcontrol.dart';
import 'package:xtreme_fitness/landingpages/sections/contact/contactdesktop.dart';
import 'package:xtreme_fitness/landingpages/sections/gallery/gallerydesktop%20copy.dart';
import 'package:xtreme_fitness/landingpages/sections/home/homedesktop.dart';
import 'package:xtreme_fitness/landingpages/sections/prices/pricesdesktop.dart';
import 'package:xtreme_fitness/landingpages/sections/services/desktopservices.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  // AnimationController? landingcontroller;
  // AnimationController? pricingcontroller;
  // AnimationController? servicecontroller;
  // AnimationController? contactcontroller;

  void changeScrolltoScreen(int index) {
    debugPrint("in scroll control");
    itemScrollController.scrollTo(
        index: index % 4,
        duration: const Duration(seconds: 2),
        curve: Curves.easeInOutCubic);
  }

  @override
  Widget build(BuildContext context) {
    GetxLandingcontroller landctrl = Get.put(GetxLandingcontroller());


    return Scrollbar(
      
      child: ScrollablePositionedList.builder(
        itemScrollController: landctrl.scrollControllers,
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
        // children: [
        // // HomePage(),
        // HomeDesktop(),
        // // Prices(),
        // Pricesdesktop(),
        // // // Services(),
        // ServicesDesktop(),
        // // // Gallery(),
        // GalleryDesktop(),
        // // // Contact()
        // ContactDesktop()
        // ],
      ),
    );
  }
}
