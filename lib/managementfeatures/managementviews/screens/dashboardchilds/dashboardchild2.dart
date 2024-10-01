import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/managementfeatures/config/manageconfig.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/managementcontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/widgets/chartwidgets.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';

import '../../../../widgets/titletext.dart';
import '../../../managementdomain/entities.dart/userpaymentmodel.dart';

class DashboardChild2 extends StatelessWidget {
  const DashboardChild2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ManagementController>(builder: (managectrl) {
      return CardwithShadow(
        padding: EdgeInsets.zero,
        child: managectrl.weeklypayments.isEmpty?Center(child: CircularProgressIndicator(color: Colors.white,)) : Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleText("Sales"),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Earnings"),
                    ],
                  ),
                  Text(
                    "Previous 30 days",
                    style: TextStyle(fontSize: 10),
                  ),
                  // DropdownButton(
                  //   underline: const SizedBox(),
                  //   hint: const Text(
                  //     "Week",
                  //     style: TextStyle(fontSize: 10),
                  //   ),
                  //   value: 0,
                  //   items: List.generate(
                  //     3,
                  //     (index) => DropdownMenuItem(
                  //         value: index,
                  //         child: Text(dayslist[index],
                  //             style: const TextStyle(fontSize: 10))),
                  //   ),
                  //   onChanged: (value) {},
                  // )
                ],
              ),
            ),
            Expanded(
                child: GraphsWidget(
                        charttype: ChartType.line,
                        tooltip:
                            (data, point, series, pointIndex, seriesIndex) =>
                                SizedBox(
                          // height: 100,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                  '${managectrl.weeklypayments.values.elementAt(pointIndex).last.paymentDate.day}/${managectrl.weeklypayments.values.elementAt(pointIndex).last.paymentDate.month}/${managectrl.weeklypayments.values.elementAt(pointIndex).last.paymentDate.year}'),
                              Text("Rs. ${data.toStringAsFixed(0)}"),
                            ],
                          ),
                        ),
                        seriesdata: managectrl.weeklypayments.entries.map((e) {
                          double d = 0;
                          for (Alluserpaymentmodel x in e.value) {
                            d = d + x.receivedAmount ?? 0;
                          }

                          //print("in weekly payment $d");
                          return d;
                        }).toList(),
                        ontap: (v) {},
                        axis: false,
                      ))
          ],
        ),
      );
    });
  }
}
