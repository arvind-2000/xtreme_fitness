import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/managementcontroller.dart';
import 'package:xtreme_fitness/widgets/normaltext.dart';
import 'package:xtreme_fitness/widgets/titletext.dart';

import '../../../../widgets/cardswithshadow.dart';
import '../dashboardchilds/dashboardchild1.dart';
import '../dashboardchilds/dashboardchild2.dart';
import '../dashboardchilds/dashboardchild3.dart';
import '../dashboardchilds/dashboardchild4.dart';
import '../dashboardchilds/dashboardchild5.dart';

class DashboardMobileScreen extends StatelessWidget {
  const DashboardMobileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ManagementController>(builder: (controller) {
      return controller.managementloadings
          ? Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.secondary,
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ///appbar heights
                    // SizedBox(height: 80,),
                    SizedBox(
                      height: 250,
                      child: CardwithShadow(
                        padding: const EdgeInsets.all(32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const NormalText(
                              text: "Total",
                              size: 16,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TitleText(
                              "${controller.getallXtremer.length} ${controller.getallXtremer.length > 1 ? "Members" : "Member"}",
                              size: 30,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    TitleText(controller
                                        .allpersonalxtremer.length
                                        .toString()),
                                    const Text("Personal")
                                  ],
                                ),
                                Column(
                                  children: [
                                    TitleText(controller
                                        .allgeneralxtremer.length
                                        .toString()),
                                    const Text("General")
                                  ],
                                ),
                                Column(
                                  children: [
                                    TitleText((controller.getallXtremer.length -
                                            (controller
                                                    .allinactivextremer.length +
                                                controller
                                                    .allgeneralxtremer.length +
                                                controller
                                                    .allpersonalxtremer.length))
                                        .toString()),
                                    const Text("Others")
                                  ],
                                ),
                                Column(
                                  children: [
                                    TitleText(controller
                                        .allinactivextremer.length
                                        .toString()),
                                    const Text("Inactive")
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const SizedBox(height: 400, child: DashboardChild1()),
                    const SizedBox(
                      height: 24,
                    ),
                    const SizedBox(height: 400, child: DashboardChild2()),
                    const SizedBox(
                      height: 24,
                    ),
                    const SizedBox(height: 400, child: DashboardChild3()),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(height: 400, child: DashboardChild4()),
                    const SizedBox(
                      height: 24,
                    ),
                    const SizedBox(height: 400, child: Dashboardchild5()),
                  ],
                ),
              ),
            );
    });
  }
}
