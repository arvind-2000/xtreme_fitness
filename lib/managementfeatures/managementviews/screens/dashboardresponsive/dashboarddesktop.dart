import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/managementcontroller.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';
import 'package:xtreme_fitness/widgets/titletext.dart';

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
    ManagementController controller = Get.put(ManagementController());
    return GetBuilder<ManagementController>(builder: (_) {
      return controller.managementloading?Center(child: CircularProgressIndicator(color:Theme.of(context).colorScheme.secondary,),):SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(height: 80,
            // child: Row(),),
            // Cardonly(
            //   child: Row(

            //      children: [
            //        const Cardonly(
            //          color: Colors.transparent,
            //          child: Text("Today"),
            //        ),
            //        const Cardonly(
            //          color: Colors.transparent,
            //          child: Text("Week"),
            //        ),
            //                 Cardonly(
            //                   color: Theme.of(context).colorScheme.secondary.withOpacity(0.4),
            //          child: const Text("Monthly"),
            //        ),
            //             Container(width:1,height:50,color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),),
            //                         Cardonly(
            //                   color: Colors.transparent,
            //          child: const Text("Renewals"),

            //        ),
            //                              Cardonly(
            //                   color: Colors.transparent,
            //          child: const Text("Members"),

            //        ),
            //      ],
            //    ),
            // ),
            //       Container(
            //   height: 0.5,
            //   width:double.maxFinite,
            //   color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
            // ),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
            child: Row(
              children: [
                Text(
                  "$num",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  "members",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
