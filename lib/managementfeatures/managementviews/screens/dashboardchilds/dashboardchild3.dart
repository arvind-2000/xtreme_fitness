import 'dart:math';

import 'package:flutter/material.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';

import '../../../../config/const.dart';
import '../../../../widgets/titletext.dart';
import '../../../config/manageconfig.dart';
import '../../widgets/chartwidgets.dart';

class DashboardChild3 extends StatelessWidget {
  const DashboardChild3({
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
                    TitleText("Analytics"),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Services"),
                  ],
                ),
                DropdownButton(
                  underline: const SizedBox(),
                  hint: const Text(
                    "Week",
                    style: TextStyle(fontSize: 10),
                  ),
                  value: 0,
                  items: List.generate(
                    3,
                    (index) => DropdownMenuItem(
                        value: index,
                        child: Text(dayslist[index],
                            style: const TextStyle(fontSize: 10))),
                  ),
                  onChanged: (value) {},
                )
              ],
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GraphsWidget(
              charttype: ChartType.bar,
              seriesdata:
                  List.generate(7, (index) => Random().nextInt(100).toDouble()),
              ontap: (v) {},
              axis: true,
            ),
          ))
        ],
      ),
    );
  }
}
