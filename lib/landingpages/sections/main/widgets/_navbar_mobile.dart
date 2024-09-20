import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/pages/dialogs/mobile/logindialogmobile.dart';
import 'package:xtreme_fitness/landingpages/controllers/getxcontrol.dart';
import 'package:xtreme_fitness/widgets/cardborder.dart';

class NavBarMobile extends StatelessWidget {
  const NavBarMobile({super.key});

  @override
  Widget build(BuildContext context) {
    GetxLandingcontroller landctrl = Get.put(GetxLandingcontroller());

    return Container(
      color: Colors.black54,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              highlightColor: Colors.white54,
              onPressed: () {
                landctrl.key.currentState!.openDrawer();
              },
              icon: const Icon(
                Icons.menu,
              ),
            ),

            Row(
              children: [
                CardBorder(
                  onpress: () {
                    Get.dialog(
                        barrierDismissible: true,
                        const LoginDialogMobile(
                          signupdialog: false,
                        ));
                  },
                  margin: const EdgeInsets.all(4),
                  color: Colors.red[800],
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Log In",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.red[800],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                // CardwithShadow(
                //   onpress: () {
                //     // authctrl.changeAuthPage(0);
                //     // Get.toNamed("/signup");
                //   },
                //   color: Colors.red[800],
                //   padding:
                //       const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                //   child: const Text(
                //     "Sign Up",
                //     style: TextStyle(
                //         fontSize: 12,
                //         fontWeight: FontWeight.bold,
                //         color: Colors.white),
                //   ),
                // ),
              ],
            )

            // Responsive.isMobile(context) ? const SizedBox() : const NavBarLogo(),
            // Space.x1!,
          ],
        ),
      ),
    );
  }
}
