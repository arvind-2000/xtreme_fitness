import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/paymententity.dart';
import 'package:xtreme_fitness/managementfeatures/managementmodels/calculationusecase.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/managementcontroller.dart';
import 'package:xtreme_fitness/widgets/cardborder.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';

import '../../../../widgets/titletext.dart';
import '../../widgets/scaffolds.dart';

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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white.withOpacity(0.8),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Center(
                            child: Text(
                      "Name",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ))),
                    Expanded(
                        child: Center(
                            child: Text(
                      "Type",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ))),
                    Expanded(
                        child: Center(
                            child: Text(
                      "Amount",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ))),
                    Expanded(
                        child: Center(
                            child: Text(
                      "Date",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ))),
                    Expanded(
                        child: Center(
                            child: Text(
                      "Status",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ))),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (c, i) {
              return InkWell(
                onTap: () {
                  Get.dialog(Dialog(
                    child: SizedBox(
                      width: 500,
                      height: 600,
                      child: Padding(
                        padding: const EdgeInsets.all(32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             SizedBox(height: 16,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                HeadingText("Payment Details"),
                                IconButton(onPressed: (){
                                  Navigator.pop(context);
                                }, icon: Icon(Icons.close,size:16,))
                              ],
                            ),
                             SizedBox(height: 16,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Name",style: TextStyle(fontSize: 14),),
                                  Text("${managectrl.latestpayment10[i].name}",style: TextStyle(fontSize: 16),),
                                   SizedBox(height: 16,),
                                  Text("Payment Method",style: TextStyle(fontSize: 14),),
                                  Text(
                                      "${managectrl.latestpayment10[i].paymentMethod}"),
                                       SizedBox(height: 16,),
                                  Row(
                                    children: [
                                      Text("Transaction Id",style: TextStyle(fontSize: 14),),
                                      SizedBox(width: 10,),
                                      IconButton(onPressed: (){
                                       Clipboard.setData(ClipboardData(text: "${managectrl.latestpayment10[i].transactionId}"));
                                          CustomSnackbar(context, "Text copied to Clipboard");
                                      }, icon: Icon(Icons.copy,size: 14,color: Colors.grey[300],))
                                    ],
                                  ),
                                  Text(
                                      "${managectrl.latestpayment10[i].transactionId}"),
                                       SizedBox(height: 16,),
                                  Text("Amount",style: TextStyle(fontSize: 14),),
                                  Text(
                                      "${managectrl.latestpayment10[i].receivedAmount}",style: TextStyle(fontSize: 16),),
                                       SizedBox(height: 16,),
                                  Text("Date",style: TextStyle(fontSize: 14),),
                                  Text(
                                      "${managectrl.latestpayment10[i].paymentDate.day}/${managectrl.latestpayment10[i].paymentDate.month}/${managectrl.latestpayment10[i].paymentDate.year}",style: TextStyle(fontSize: 16),),
                                  SizedBox(height: 16,),
                                  Text("Status",style: TextStyle(fontSize: 14),),
                                  Text("Paid",style: TextStyle(fontSize: 16),),
                                ],
                              ),
                            ),

                            SizedBox(width: double.maxFinite,child: CardBorder(
                                margin: EdgeInsets.zero,
                              color: Colors.blue,
                              onpress: (){
                                createAndPrintPdf(Paymententity(id: managectrl.latestpayment10[i].id, userId: managectrl.latestpayment10[i].userId!, amount: managectrl.latestpayment10[i].amount!, discountPercentage: managectrl.latestpayment10[i].discountPercentage!.toDouble(), receivedAmount: managectrl.latestpayment10[i].receivedAmount, paymentDate: managectrl.latestpayment10[i].paymentDate, transactionId:managectrl.latestpayment10[i].transactionId!, paymentStatus: managectrl.latestpayment10[i].paymentStatus!, paymentMethod:managectrl.latestpayment10[i].paymentMethod!, paymentType: managectrl.latestpayment10[i].paymentType!, subscriptionId: managectrl.latestpayment10[i].subscriptionId, serviceUsageId: managectrl.latestpayment10[i].serviceUsageId, termsAndConditions: true));
                              },
                              child: Center(child: Text("Print Receipt",style: TextStyle(fontSize: 16),))),)
                          ],
                        ),
                      ),
                    ),
                  ));
                },
                child: Padding(
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
