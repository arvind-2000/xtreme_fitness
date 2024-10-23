import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/managementfeatures/managementmodels/logics.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/managementcontroller.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';

import '../../../../widgets/titletext.dart';

class DashboardChild1 extends StatelessWidget {
  const DashboardChild1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ManagementController>(builder: (managectrl) {
      return Card(
        color: const Color.fromARGB(95, 56, 0, 0),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          HeadingText(
                            "Today Earnings",
                            size: 22,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                        style: TextStyle(color: Colors.grey[500]),
                      ),
                    ],
                  ),
                  Text(
                    "$rupee ${Logics.totalamounts(managectrl.getallpayments, DateTime.now())}",
                    style: TextStyle(fontSize: 40, color: Colors.grey[300]),
                  )
                ],
              ),
              // body

              // CardwithShadow(
              //   margin: EdgeInsets.all(0),
              //   padding: EdgeInsets.all(8),

              //   child:  Text("See More",style: TextStyle(color: Theme.of(context).colorScheme.secondary,fontWeight: FontWeight.bold),))

              ///trailing
            ],
          ),
        ),
      );
    });
  }
}
