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
                  height: 40,
                  child: InkWell(
                      onTap: () {
                        landingcontroller.setnavindex(0);
                        landingcontroller.changeScrolltoScreen(0);
                      },
                      child: Image.asset(height: 50, "assets/logo2.png")),
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
                        landingcontroller.changeScrolltoScreen(e.key);
                        // landingcontroller.scroll(e.key, isMobile: true);
                        Navigator.pop(context);
                      },
                      title: Text(
                        e.value,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSecondary),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      );
    });
  }
}
