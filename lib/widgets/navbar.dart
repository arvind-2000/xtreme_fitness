import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/controller/authcontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/editcontactinfo/contactcontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/widgets/dialogswidget.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';

import '../managementfeatures/managementviews/controllers/pagecontroller.dart';
import '../managementfeatures/managementviews/screens/dashboard.dart';
import '../responsive/responsive.dart';
import 'card.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
    required this.authctrl,
  });

  final GetxAuthController authctrl;

  void _toggleDrawer(BuildContext context) {
    if (Scaffold.of(context).isDrawerOpen) {
      Navigator.pop(context);
    }
  }

  Widget _buildNavTile(
      BuildContext context, int index, IconData icon, String title,{String? iconImage}) {
    final pagectrl = Get.find<GetxPageController>();
    final isSelected = pagectrl.navpage == index;
   
    return Cardonly(
      color: isSelected
          ? Theme.of(context).colorScheme.secondary.withOpacity(0.3)
          : Colors.transparent,
      onpress: () {
        if (Responsive.isMobile(context) || Responsive.isTablet(context)) {
          _toggleDrawer(context);
        }
        pagectrl.changeNavPage(index);
      },
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: NavTiles(icon: icon, title: title,image:iconImage),
    );
  }

  @override
  Widget build(BuildContext context) {
    Get.put(ContactController());
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLogo(context),
          _buildDivider(context),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(height: 16),
                  _buildNavTile(context, 0, Icons.dashboard, 'Dashboard', ),
                  _buildDivider(context),
                  _buildNavTile(
                      context, 3, FontAwesomeIcons.briefcase, 'Services'),
                  _buildNavTile(
                      context, 5, FontAwesomeIcons.boxesPacking, 'Plans'),
                  _buildDivider(context),
                  _buildNavTile(
                      context, 10, FontAwesomeIcons.chalkboardUser, 'Trainer'),
                  _buildNavTile(
                      context, 4, FontAwesomeIcons.clipboardUser, 'Staff'),
                  _buildDivider(context),
                  _buildNavTile(
                      context, 2, FontAwesomeIcons.userPlus, 'Add Member'),
                  _buildNavTile(
                      context, 6, FontAwesomeIcons.solidUser, 'Xtremers'),
                  _buildNavTile(
                      context, 7, FontAwesomeIcons.creditCard, 'Payments'),
                  _buildNavTile(context, 15, FontAwesomeIcons.handsHoldingChild,
                      'Service Usage'),
                  _buildDivider(context),
                  _buildNavTile(context, 8, FontAwesomeIcons.gears, 'Settings'),
                  _buildNavTileWithMessage(
                      context, 9, FontAwesomeIcons.solidMessage, 'Message'),
                ],
              ),
            ),
          ),
          _buildDivider(context),
          const SizedBox(height: 10),
          _buildLogoutTile(context),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    final pagectrl = Get.find<GetxPageController>();
    return InkWell(
      onTap: () => pagectrl.changeNavPage(0),
      child: SizedBox(
        height: 70,
        width:double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.asset("assets/logo2.png",fit:BoxFit.contain),
        ),
      ),
    );
  }

  Widget _buildDivider(BuildContext context) {
    return Container(
      height: 0.5,
      width: double.infinity,
      color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.1),
    );
  }

  Widget _buildNavTileWithMessage(
      BuildContext context, int index, IconData icon, String title) {
    final contactCtrl = Get.find<ContactController>();
    return GetBuilder<ContactController>(builder: (_) {
      return Cardonly(
        color: Get.find<GetxPageController>().navpage == index
            ? Theme.of(context).colorScheme.secondary.withOpacity(0.3)
            : Colors.transparent,
        onpress: () {
          if (Responsive.isMobile(context) || Responsive.isTablet(context)) {
            _toggleDrawer(context);
          }
          Get.find<GetxPageController>().changeNavPage(index);
        },
        margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Row(
          children: [
            NavTiles(icon: icon, title: title),
            const SizedBox(width: 5),
            if (contactCtrl.unreadmessagelist.isNotEmpty)
              Text(
                '( ${contactCtrl.unreadmessagelist.length} )',
                style: const TextStyle(color: Colors.red),
              ),
          ],
        ),
      );
    });
  }

  Widget _buildLogoutTile(BuildContext context) {
    return Cardonly(
      color: Colors.transparent,
      onpress: () {
        if (Responsive.isMobile(context) || Responsive.isTablet(context)) {
          _toggleDrawer(context);
        }
        Get.dialog(
          barrierDismissible: !authctrl.loginloading,
          StatefulBuilder(builder: (context, setState) {
            return PageDialog(
              iscancelreg: true,
              no: authctrl.loginloading
                  ? null
                  : () {
                      Get.back();
                    },
              yes: authctrl.loginloading
                  ? null
                  : () {
                      setState(() {
                        authctrl.logout();
                      });

                      //  Get.back();
                    },
              allignToCenter: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(FontAwesomeIcons.rightFromBracket),
                      SizedBox(width: 5),
                      HeadingText("Log Out", size: 20),
                    ],
                  ),
                  const SizedBox(height: 30),
                  authctrl.loginloading
                      ? const Center(
                          child: CircularProgressIndicator(color: Colors.white))
                      : const Center(
                          child: Text(
                            "Are you sure you want to logout?\nPress yes to confirm",
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ),
                ],
              ),
            );
          }),
        );
      },
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: const NavTiles(
        icon: Icons.logout,
        title: 'Log Out',
      ),
    );
  }
}
