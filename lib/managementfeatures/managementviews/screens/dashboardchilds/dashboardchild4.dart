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
        padding: const EdgeInsets.symmetric(vertical:16),
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: TitleText("Payments"),
          ),
          const SizedBox(
            height: 16,
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text("Recent Transactions"),
          ),
          const SizedBox(
            height: 5,
          ),
          //header for table
          Container(
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(10),
              color: Colors.white.withOpacity(0.2),
            ),
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                      child: Center(
                          child: FittedBox(
                            child: Text(
                                                "Name",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                              ),
                          ))),
                  Expanded(
                      child: Center(
                          child: FittedBox(
                            child: Text(
                                                "Type",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                              ),
                          ))),
                  Expanded(
                      child: Center(
                          child: FittedBox(
                            child: Text(
                                                "Amount",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold),
                                              ),
                          ))),
                  Expanded(
                      child: Center(
                          child: FittedBox(
                            child: Text(
                                                "Date",
                                                style: TextStyle(
                                                 fontWeight: FontWeight.bold),
                                              ),
                          ))),
                  Expanded(
                      child: Center(
                          child: FittedBox(
                            child: Text(
                                                "Status",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                              ),
                          ))),
                ],
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
                             const SizedBox(height: 16,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const HeadingText("Payment Details"),
                                IconButton(onPressed: (){
                                  Navigator.pop(context);
                                }, icon: const Icon(Icons.close,size:16,))
                              ],
                            ),
                             const SizedBox(height: 16,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Name",style: TextStyle(fontSize: 14),),
                                  Text("${managectrl.latestpayment10[i].name}",style: const TextStyle(fontSize: 16),),
                                   const SizedBox(height: 16,),
                                  const Text("Payment Method",style: TextStyle(fontSize: 14),),
                                  Text(
                                      "${managectrl.latestpayment10[i].paymentMethod}"),
                                       const SizedBox(height: 16,),
                                  Row(
                                    children: [
                                      const Text("Transaction Id",style: TextStyle(fontSize: 14),),
                                      const SizedBox(width: 10,),
                                      IconButton(onPressed: (){
                                       Clipboard.setData(ClipboardData(text: "${managectrl.latestpayment10[i].transactionId}"));
                                          CustomSnackbar(context, "Text copied to Clipboard");
                                      }, icon: Icon(Icons.copy,size: 14,color: Colors.grey[300],))
                                    ],
                                  ),
                                  Text(
                                      "${managectrl.latestpayment10[i].transactionId}"),
                                       const SizedBox(height: 16,),
                                  const Text("Amount",style: TextStyle(fontSize: 14),),
                                  Text(
                                      "${managectrl.latestpayment10[i].receivedAmount}",style: const TextStyle(fontSize: 16),),
                                       const SizedBox(height: 16,),
                                  const Text("Date",style: TextStyle(fontSize: 14),),
                                  Text(
                                      "${managectrl.latestpayment10[i].paymentDate.day}/${managectrl.latestpayment10[i].paymentDate.month}/${managectrl.latestpayment10[i].paymentDate.year}",style: const TextStyle(fontSize: 16),),
                                  const SizedBox(height: 16,),
                                  const Text("Status",style: TextStyle(fontSize: 14),),
                                  const Text("Paid",style: TextStyle(fontSize: 16),),
                                ],
                              ),
                            ),

                            SizedBox(width: double.maxFinite,child: CardBorder(
                                margin: EdgeInsets.zero,
                              color: Colors.blue,
                              onpress: (){
                                createAndPrintPdf(Paymententity(id: managectrl.latestpayment10[i].id, userId: managectrl.latestpayment10[i].userId!, amount: managectrl.latestpayment10[i].amount!, discountPercentage: managectrl.latestpayment10[i].discountPercentage!.toDouble(), receivedAmount: managectrl.latestpayment10[i].receivedAmount, paymentDate: managectrl.latestpayment10[i].paymentDate, transactionId:managectrl.latestpayment10[i].transactionId!, paymentStatus: managectrl.latestpayment10[i].paymentStatus!, paymentMethod:managectrl.latestpayment10[i].paymentMethod!, paymentType: managectrl.latestpayment10[i].paymentType!, subscriptionId: managectrl.latestpayment10[i].subscriptionId, serviceUsageId: managectrl.latestpayment10[i].serviceUsageId, termsAndConditions: true),name:managectrl.getallXtremer.firstWhere((element) => element.XtremerId == managectrl.latestpayment10[i].userId,).firstName!+managectrl.getallXtremer.firstWhere((element) => element.XtremerId == managectrl.latestpayment10[i].userId,).surname!);
                              },
                              child: const Center(child: Text("Print Receipt",style: TextStyle(fontSize: 16),))),)
                          ],
                        ),
                      ),
                    ),
                  ));
                },
                child: Container(
                     color: i%2==0?Colors.blueGrey[200]!.withOpacity(0.3):Colors.blueGrey[200]!.withOpacity(0.5),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Center(
                          child:FittedBox(child: Text("${managectrl.latestpayment10[i].name}")),
                        )),
                        const SizedBox(width: 5,),
                        Expanded(
                            child: Center(
                          child: FittedBox(
                            child: Text(
                                "${managectrl.latestpayment10[i].paymentMethod}"),
                          ),
                        )),
                              const SizedBox(width: 5,),
                        Expanded(
                            child: Center(
                          child: FittedBox(
                            child: Text(
                                "${managectrl.latestpayment10[i].receivedAmount}"),
                          ),
                        )),
                              const SizedBox(width: 5,),
                        Expanded(
                            child: Center(
                          child: FittedBox(
                            child: Text(
                                "${managectrl.latestpayment10[i].paymentDate.day}/${managectrl.latestpayment10[i].paymentDate.month}/${managectrl.latestpayment10[i].paymentDate.year}"),
                          ),
                        )),
                              const SizedBox(width: 5,),
                        Expanded(child: Center(child: FittedBox(child: Text(managectrl.latestpayment10[i].paymentStatus.toString())))),
                              const SizedBox(width: 5,),
                      ],
                    ),
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
