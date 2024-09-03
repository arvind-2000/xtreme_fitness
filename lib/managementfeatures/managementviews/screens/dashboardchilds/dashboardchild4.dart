import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/managementcontroller.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';

import '../../../../widgets/titletext.dart';

class DashboardChild4 extends StatelessWidget {
  const DashboardChild4({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ManagementController>(builder: (managectrl) {
      return CardwithShadow(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleText("Payments"),
          const SizedBox(
            height: 16,
          ),
          const Text("Recent Transactions"),
          const SizedBox(
            height: 5,
          ),
          //header for table
          const Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(child: Center(child: Text("Name"))),
                Expanded(child: Center(child: Text("Type"))),
                Expanded(child: Center(child: Text("Amount"))),
                Expanded(child: Center(child: Text("Date"))),
                Expanded(child: Center(child: Text("Status"))),
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (c, i) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                        child: Center(
                      child: Text("${managectrl.latestpayment10[i].name}"),
                    )),
                    Expanded(
                        child: Center(
                      child: Text(
                          "${managectrl.latestpayment10[i].paymentMethod}"),
                    )),
                    Expanded(
                        child: Center(
                      child: Text(
                          "${managectrl.latestpayment10[i].receivedAmount}"),
                    )),
                    Expanded(
                        child: Center(
                      child: Text(
                          "${managectrl.latestpayment10[i].paymentDate.day}/${managectrl.latestpayment10[i].paymentDate.month}/${managectrl.latestpayment10[i].paymentDate.year}"),
                    )),
                    const Expanded(child: Center(child: Text("Paid"))),
                  ],
                ),
              );
            },
            itemCount: managectrl.latestpayment10.length,
          ))
        ],
      ));
    });
  }
}
