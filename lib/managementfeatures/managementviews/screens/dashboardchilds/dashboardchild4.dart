
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
    return GetBuilder<ManagementController>(
      builder: (managectrl) {
        return CardwithShadow(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          TitleText("Payments"),
          SizedBox(height: 16,),
          Text("Recent Transactions"),
          SizedBox(height: 5,),
          //header for table
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(children: [
              Expanded(child: Text("Name")),
              Expanded(child: Text("Type")),
              Expanded(child: Text("Amount")),
              Expanded(child: Text("Date")),
              Expanded(child: Text("Status")),
               
            ],),
          ),
          Expanded(child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (c,i){
        
            return     Padding(
              padding: const EdgeInsets.all(16),
              child: Row(children: [
              Expanded(child: Text("${managectrl.getallpayments[i].transactionid}")),
              Expanded(child: Text("${managectrl.getallpayments[i].paymentmethod}")),
              Expanded(child: Text("${managectrl.getallpayments[i].amount}")),
              Expanded(child: Text("${managectrl.getallpayments[i].datetime}")),
              Expanded(child: Text("Paid" )),
                 
                    ],),
            );
          },itemCount: managectrl.getallpayments.length,))
        ],));
      }
    );
  }
}


