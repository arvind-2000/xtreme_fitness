import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/landingpages/controllers/getxcontrol.dart';
import 'package:xtreme_fitness/widgets/normaltext.dart';

class NavBarActionButton extends StatelessWidget {
  final String label;
  final int index;
  const NavBarActionButton({
    super.key,
    required this.label,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    GetxLandingcontroller landctrl = Get.put(GetxLandingcontroller());

    return GetBuilder<GetxLandingcontroller>(builder: (_) {
      return Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: MouseRegion(
            onEnter: (_) => landctrl.onHover(true, index),
            onExit: (_) => landctrl.onHover(false, index),
            child: MaterialButton(
              color:
                  landctrl.navindex == index ? const Color(0xffC0392B) : null,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: landctrl.isHovered
                      ? landctrl.hoverindex == index
                          ? const Color(0xffC0392B)
                          : Colors.transparent
                      : Colors.transparent, // Change this color as needed
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(
                    20), // Change the value to adjust the roundness
              ),
              hoverElevation: 20,
              splashColor: Colors.white54,
              highlightColor: Colors.white54,
              onPressed: () {
                landctrl.setnavindex(index);
                log(index.toString());
                landctrl.changeScrolltoScreen(index);
                // landctrl.scroll(index);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: NormalText(
                  text: label,
                  size: 16,
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
