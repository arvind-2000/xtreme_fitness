import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/managementcontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/pagecontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/editcontactinfo/contactcontroller.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';
import 'package:xtreme_fitness/widgets/titletext.dart';

import '../../../../widgets/cardborder.dart';
import '../dashboardchilds/dashboardchild1.dart';
import '../dashboardchilds/dashboardchild2.dart';
import '../dashboardchilds/dashboardchild3.dart';
import '../dashboardchilds/dashboardchild4.dart';
import '../dashboardchilds/dashboardchild5.dart';

class DashboardDesktopScreen extends StatelessWidget {
  const DashboardDesktopScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ManagementController controller = Get.find<ManagementController>();
    GetxPageController pagecontrl = Get.put(GetxPageController());
    ContactController cntrl = Get.put(ContactController());
    return GetBuilder<ContactController>(builder: (_) {
      return GetBuilder<ManagementController>(builder: (_) {
        return controller.managementloadings
            ? Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 70,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // TitleText(pagectrl.navpage==0?"Overview":pagectrl.navpage==3?"Services":pagectrl.navpage==5?"Plans":pagectrl.navpage==10?"Trainer":pagectrl.navpage==4?"Staff":pagectrl.navpage==2?"Add Member":pagectrl.navpage==6?"Xtremers":pagectrl.navpage==7?"Payments":""),
                            const HeadingText("OverView"),

                            Row(
                              children: [
                                badges.Badge(
                                  position:
                                      badges.BadgePosition.topEnd(end: -13),
                                  showBadge: cntrl.unreadmessagelist.isNotEmpty
                                      ? true
                                      : false,
                                  onTap: () {
                                    // cntrl.onBadgeTap();
                                    pagecontrl.changeNavPage(9);
                                  },
                                  badgeContent: Text(cntrl
                                      .unreadmessagelist.length
                                      .toString()),
                                  child: MaterialButton(
                                      minWidth: 0,
                                      padding: EdgeInsets.zero,
                                      hoverColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      onPressed: () {
                                        // cntrl.onBadgeTap();
                                        pagecontrl.changeNavPage(9);
                                      },
                                      child: const Icon(Icons.message)),
                                ),
                                CardBorder(
                                    child: Row(
                                  children: [
                                    Icon(Icons.person,
                                        size: 14,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Text(controller.authctrl.getuser != null
                                        ? controller
                                                .authctrl.getuser!.roleName ??
                                            "Member"
                                        : "Member"),
                                  ],
                                ))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Expanded(
                            child: CardwithShadow(
                                margin: const EdgeInsets.only(right: 16),
                                child: OverviewMembertitle(
                                  num: controller.getallXtremer.length,
                                  title: "Total",
                                )),
                          ),
                          Expanded(
                            child: CardwithShadow(
                                margin: const EdgeInsets.only(right: 16),
                                child: OverviewMembertitle(
                                  num: controller.allpersonalxtremer.length,
                                  title: "Personal",
                                )),
                          ),
                          Expanded(
                            child: CardwithShadow(
                                margin: const EdgeInsets.only(right: 16),
                                child: OverviewMembertitle(
                                  num: controller.allgeneralxtremer.length,
                                  title: "General",
                                )),
                          ),
                          Expanded(
                            child: CardwithShadow(
                                margin: const EdgeInsets.only(right: 16),
                                child: OverviewMembertitle(
                                  num: controller.getallXtremer.length -
                                      (controller.allinactivextremer.length +
                                          controller.allgeneralxtremer.length +
                                          controller.allpersonalxtremer.length),
                                  title: "Others",
                                )),
                          ),
                          Expanded(
                            child: CardwithShadow(
                                child: OverviewMembertitle(
                              num: controller.allinactivextremer.length,
                              title: "Inactive",
                            )),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        height: 400,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        color: Colors.transparent,
                        child: const Row(
                          children: [
                            Expanded(child: DashboardChild1()),
                            SizedBox(
                              width: 16,
                            ),
                            Expanded(child: DashboardChild2()),
                            SizedBox(
                              width: 16,
                            ),
                            Expanded(child: DashboardChild3()),
                          ],
                        )),
                    Container(
                        height: 500,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        color: Colors.transparent,
                        child: const Row(
                          children: [
                            Expanded(flex: 3, child: DashboardChild4()),
                            SizedBox(
                              width: 16,
                            ),
                            Expanded(flex: 2, child: Dashboardchild5()),
                          ],
                        )),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              );
      });
    });
  }
}

class OverviewMembertitle extends StatelessWidget {
  const OverviewMembertitle({
    super.key,
    required this.title,
    required this.num,
  });
  final String title;
  final int num;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width:150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.person,
                size: 14,
              ),
              const SizedBox(
                width: 6,
              ),
              TitleText(
                title,
                size: 16,
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          FittedBox(
            child: HoverDashboardText(num: num),
          )
        ],
      ),
    );
  }
}

class HoverDashboardText extends StatefulWidget {
  const HoverDashboardText({
    super.key,
    required this.num,
  });

  final int num;

  @override
  State<HoverDashboardText> createState() => _HoverDashboardTextState();
}

class _HoverDashboardTextState extends State<HoverDashboardText> {
  bool hover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (v){
        setState(() {
         hover = v; 
        });
      },
      onTap:(){},
      mouseCursor: MouseCursor.uncontrolled,
      child: Row(
        children: [
          Text(
            "${widget.num}",
            style:  TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold,color:hover?null:Colors.grey[400]),
          ),
          const SizedBox(
            width: 5,
          ),
      Text(
            "members",
            style: TextStyle(
              fontSize: 16,
             color:hover?null:Colors.grey[400]
            ),
          )
        ],
      ),
    );
  }
}
