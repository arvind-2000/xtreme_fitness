import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/pagecontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/widgets/circularchartwidget.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';

import '../../../../widgets/titletext.dart';

class Dashboardchild5 extends StatelessWidget {
  const Dashboardchild5({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    GetxPageController pgctrl = Get.put(GetxPageController());
    return GetBuilder<GetxPageController>(builder: (_) {
      return CardwithShadow(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TitleText("Members"),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(pgctrl.overalldropdownname),
                    ],
                  ),
                  Card(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: DropdownButton<String>(
                            alignment: Alignment.center,
                            borderRadius: BorderRadius.circular(10),
                            style: const TextStyle(color: Colors.black),
                            underline: const SizedBox(),
                            value: pgctrl.overalldropdownname,
                            dropdownColor: Colors.white,
                            items: dayslist2.map((String option) {
                              return DropdownMenuItem<String>(
                                value: option,
                                child: Text(option,
                                    style: const TextStyle(
                                      fontSize: 10,
                                      color: Colors.black,
                                    )),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              pgctrl.overalldropdown(newValue!);
                            }),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Expanded(child: PieChartWidget()
                //  RadialBarScreen(waterLevellist: [100,40,80],)

                )
          ],
        ),
      );
    });
  }
}
