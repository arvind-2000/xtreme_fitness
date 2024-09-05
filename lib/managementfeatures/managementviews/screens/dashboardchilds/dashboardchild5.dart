import 'package:flutter/material.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/widgets/circularchartwidget.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';

import '../../../../widgets/titletext.dart';

class Dashboardchild5 extends StatelessWidget {
  const Dashboardchild5({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CardwithShadow(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleText("Activities"),
                    SizedBox(
                      height: 5,
                    ),
                    Text("OverAll"),
                  ],
                ),
                Card(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: DropdownButton(
                        alignment: Alignment.center,
                        borderRadius: BorderRadius.circular(10),
                        style: const TextStyle(color: Colors.black),
                        underline: const SizedBox(),
                        value: 0,
                        dropdownColor: Colors.white,
                        items: List.generate(
                          3,
                          (index) => DropdownMenuItem(
                              value: index,
                              child: Text(dayslist2[index],
                                  style: const TextStyle(
                                    fontSize: 10,
                                    color: Colors.black,
                                  ))),
                        ),
                        onChanged: (value) {},
                      ),
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
  }
}
