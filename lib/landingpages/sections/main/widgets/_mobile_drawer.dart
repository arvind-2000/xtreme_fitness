import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/landingpages/controllers/getxcontrol.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    GetxLandingcontroller landingcontroller = Get.put(GetxLandingcontroller());

    return GetBuilder<GetxLandingcontroller>(builder: (_) {
      return Drawer(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  height: 70,
                  child: Image.asset(height: 50, "assets/logo2.png"),
                ),
              ),
              const Divider(),
              ...navItems.asMap().entries.map((e) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      tileColor: landingcontroller.navindex == e.key
                          ? Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.6)
                          : Colors.transparent,
                      onTap: () {
                        landingcontroller.setnavindex(e.key);
                        landingcontroller.scroll(e.key, isMobile: true);
                        Navigator.pop(context);
                      },
                      // leading: Icon(
                      //   NavBarUtils.icons[e.key],
                      //   color: AppTheme.c!.primary,
                      // ),
                      title: Text(
                        e.value,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSecondary),
                      ),
                    ),
                  )),

              // Expanded(
              //   child: ListView.builder(
              //       itemCount: navItems.length,
              //       shrinkWrap: true,
              //       itemBuilder: (context, i) {
              //         return
              //       }),
              // )

              // Cardonly(
              //     margin: const EdgeInsets.symmetric(vertical: 8),
              //     color: landingcontroller.navindex == 0
              //         ? Theme.of(context).colorScheme.secondary
              //         : Colors.transparent,
              //     onpress: () {
              //       landingcontroller.setnavindex(0);

              //       landingcontroller.scroll(0, isMobile: true);
              //       Navigator.of(context).pop();
              //     },
              //     child: Text(
              //       "Home",
              //       style: TextStyle(
              //           fontSize: 14,
              //           fontWeight: FontWeight.bold,
              //           color: Theme.of(context).colorScheme.onSecondary),
              //     )),
              // Cardonly(
              //     margin: const EdgeInsets.symmetric(vertical: 8),
              //     color: landingcontroller.navindex == 1
              //         ? Theme.of(context).colorScheme.secondary
              //         : Colors.transparent,
              //     onpress: () {
              //       landingcontroller.setnavindex(1);

              //       landingcontroller.scroll(1, isMobile: true);
              //       Navigator.of(context).pop();
              //     },
              //     child: Text(
              //       "Pricing",
              //       style: TextStyle(
              //           fontSize: 14,
              //           fontWeight: FontWeight.bold,
              //           color: Theme.of(context).colorScheme.onSecondary),
              //     )),
              // Cardonly(
              //     margin: const EdgeInsets.symmetric(vertical: 8),
              //     color: landingcontroller.navindex == 2
              //         ? Theme.of(context).colorScheme.secondary
              //         : Colors.transparent,
              //     onpress: () {
              //       landingcontroller.setnavindex(2);

              //       landingcontroller.scroll(2, isMobile: true);
              //       Navigator.of(context).pop();
              //     },
              //     child: Text(
              //       "Services",
              //       style: TextStyle(
              //           fontSize: 14,
              //           fontWeight: FontWeight.bold,
              //           color: Theme.of(context).colorScheme.onSecondary),
              //     )),
              // Cardonly(
              //     margin: const EdgeInsets.symmetric(vertical: 8),
              //     color: landingcontroller.navindex == 3
              //         ? Theme.of(context).colorScheme.secondary
              //         : Colors.transparent,
              //     onpress: () {
              //       landingcontroller.setnavindex(3);

              //       landingcontroller.scroll(3, isMobile: true);
              //       Navigator.of(context).pop();
              //     },
              //     child: Text(
              //       "Contact",
              //       style: TextStyle(
              //           fontSize: 14,
              //           fontWeight: FontWeight.bold,
              //           color: Theme.of(context).colorScheme.onSecondary),
              //     )),
            ],
          ),
        ),
      );
    });
  }
}
