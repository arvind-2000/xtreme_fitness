import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/userpaymentmodel.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/managementcontroller.dart';
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
    return GetBuilder<ManagementController>(
      builder: (managectrl) {
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
                      hint:  Text(
                        dayslist[managectrl.servicefilter],
                        style: TextStyle(fontSize: 10),
                      ),
                      value: managectrl.servicefilter,
                      items: List.generate(
                        3,
                        (index) => DropdownMenuItem(
                            value: index,
                            child: Text(dayslist[index],
                                style: const TextStyle(fontSize: 10))),
                      ),
                      onChanged: (value) {

                        managectrl.changeservicefilter(value!%3);
                      },
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GraphsWidget(
                  charttype: ChartType.bar,
              //     tooltip: (data, point, series, pointIndex, seriesIndex) =>
              // CardwithShadow(
              //   padding: const EdgeInsets.all(8),
              //   child: SizedBox(
              //     // height: 100,
              //     child: Column(
              //       mainAxisSize: MainAxisSize.min,
              //       children: [
              //         Text(managectrl.servicefilter==0?"${managectrl.filterpayments.values.elementAt(pointIndex).last.paymentDate.day}/ ${managectrl.filterpayments.values.elementAt(pointIndex).last.paymentDate.month}/${managectrl.filterpayments.values.elementAt(pointIndex).last.paymentDate.year}" :
              //         managectrl.servicefilter==1?months[(managectrl.filterpayments.values.elementAt(pointIndex).last.paymentDate.month-1)%12]:"${managectrl.filterpayments.values.elementAt(pointIndex).last.paymentDate.year}"),
              //         Text("Rs. $data"),
              //       ],
              //     ),
              //   ),
              // ),
                  seriesdata: managectrl.filterpayments.entries.map((e){
                    double d = 0;
                    for(Alluserpaymentmodel x in e.value){

                        d = d + x.amount!;

                    }

                       print("in filter payment $d");
                    return d;
                    }).toList()
                     ,
                  ontap: (v) {},
                  axis: true,
                ),
              ))
            ],
          ),
        );
      }
    );
  }
}
