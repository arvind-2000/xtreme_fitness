import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/10latestpayment.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/paymententity.dart';
import 'package:xtreme_fitness/managementfeatures/managementmodels/calculationusecase.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/managementcontroller.dart';
import 'package:xtreme_fitness/widgets/cardborder.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';

import '../../../../config/const.dart';
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
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
           const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 16),
                child: TitleText("Payments"),
              ),
    managectrl.latestpayment10.isEmpty?const SizedBox(): Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text("Last ${managectrl.latestpayment10.length}",style: TextStyle(color: Colors.grey[400]!,fontSize: 14),),
      
    ),
      const SizedBox(height: 10,),
              //header for table
            managectrl.latestpayment10.isEmpty?const SizedBox():  Container(
        
                child:  const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        "Name",
                        style: TextStyle(
                           fontSize: 14),
                      )),
                      Expanded(
                          child: Text(
                        "Type",
                        style: TextStyle(
                            fontSize: 14),
                      )),
                      Expanded(
                          child: Text(
                        "Amount",
                        style: TextStyle(
                             fontSize: 14),
                      )),
                      Expanded(
                          child: Text(
                        "Date",
                        style: TextStyle(
                            fontSize: 14),
                      )),
                      // Expanded(
                      //     child: Text(
                      //   "Status",
                      //   style: TextStyle(
                      //       fontWeight: FontWeight.bold, fontSize: 14,),
                      // )),
                    ],
                  ),
                ),
              ).animate().fadeIn(),
              Divider(color: Colors.grey[800],   indent: 0),
              Expanded(
                flex: MediaQuery.sizeOf(context).width < 800? 0:1,
                  child:managectrl.latestpayment10.isEmpty?const Center(child: Column(children: [TitleText("No Recent Payments")],),) : ListView.builder(
                shrinkWrap: true,
                physics: MediaQuery.sizeOf(context).width < 800?const NeverScrollableScrollPhysics():null, 
                itemBuilder: (c, i) {
                  
                  return ListViewCard(e: managectrl.latestpayment10[i],i: i,);
                },
                itemCount: managectrl.latestpayment10.length,
              ).animate().fadeIn())
            ],
          ));
    });
  }
}

class ListViewCard extends StatefulWidget {
  const ListViewCard({
    super.key, required this.e, required this.i,
  });
  final Paymentlatest10 e;
  final int i;
  @override
  State<ListViewCard> createState() => _ListViewCardState();
}

class _ListViewCardState extends State<ListViewCard> {
  bool onhover = false;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ManagementController>(
      builder: (managectrl) {
        return InkWell(
          onHover: (v){
            setState(() {
              onhover = v;
            });
          },
          onTap: () {
            Get.dialog(Dialog(
              insetPadding: const EdgeInsets.all(16),
              child: SizedBox(
                width: 500,
                height: 600,
                child: CardwithShadow(
                  margin: EdgeInsets.zero,
                  color: Colors.grey[900],
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                     HeadingText("Payment Details",size:MediaQuery.sizeOf(context).width<mobilescreen?16:null),
                            IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: const Icon(
                                  Icons.close,
                                  size: 16,
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                               Text(
                                "Name",
                                style: TextStyle(fontSize: 14,color: Colors.grey[500]),
                              ),
                              Text(
                                "${widget.e.name}",
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Text(
                                "Payment Method",
                                style: TextStyle(fontSize: 14,color: Colors.grey[500]),
                              ),
                              Text(
                                  "${widget.e.paymentMethod}"),
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                children: [
                              Text(
                                    "Transaction Id",
                                    style: TextStyle(fontSize: 14,color: Colors.grey[500]),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        Clipboard.setData(ClipboardData(
                                            text:
                                                "${widget.e.transactionId}"));
                                        CustomSnackbar(context,
                                            "Text copied to Clipboard");
                                      },
                                      icon: Icon(
                                        Icons.copy,
                                        size: 14,
                                        color: Colors.grey[300],
                                      ))
                                ],
                              ),
                              Text(
                                  "${widget.e.transactionId}"),
                              const SizedBox(
                                height: 16,
                              ),
                               Text(
                                "Amount",
                                style: TextStyle(fontSize: 14,color: Colors.grey[500]),
                              ),
                              Text(
                                "${widget.e.receivedAmount}",
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                            Text(
                                "Date",
                                style: TextStyle(fontSize: 14,color: Colors.grey[500]),
                              ),
                              Text(
                                "${widget.e.paymentDate.day}/${widget.e.paymentDate.month}/${widget.e.paymentDate.year}",
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                             Text(
                                "Status",
                                style: TextStyle(fontSize: 14,color: Colors.grey[500]),
                              ),
                              Text(
                                "Paid",
                                style: TextStyle(fontSize: 16,color: Colors.grey[500]),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: double.maxFinite,
                          child: CardBorder(
                              margin: EdgeInsets.zero,
                              color: Colors.blue,
                              onpress: () {
                                createAndprintPdf(
                                  Paymententity(
                                      id: 
                      widget.e.id,
                                      userId: 
                      widget.e.userId!,
                                      amount:
                      widget.e.amount!,
                                      discountPercentage: 
                      widget.e
                                          .discountPercentage!
                                          .toDouble(),
                                      receivedAmount:
                      widget.e
                                          .receivedAmount,
                                      paymentDate:
                      widget.e
                                          .paymentDate,
                                      transactionId: 
                      widget.e
                                          .transactionId!,
                                      paymentStatus:
                      widget.e
                                          .paymentStatus!,
                                      paymentMethod: 
                      widget.e
                                          .paymentMethod!,
                                      paymentType: 
                      widget.e
                                          .paymentType!,
                                      subscriptionId: 
                      widget.e
                                          .subscriptionId,
                                      serviceUsageId: 
                      widget.e
                                          .serviceUsageId,
                                      termsAndConditions: true),
                                  // name:managectrl.getallXtremer.firstWhere((element) => element.XtremerId == managectrl.latestpayment10[i].userId,).firstName!+managectrl.getallXtremer.firstWhere((element) => element.XtremerId == managectrl.latestpayment10[i].userId,).surname!
                                );
                              },
                              child: const Center(
                                  child: Text(
                                "Print Receipt",
                                style: TextStyle(fontSize: 16),
                              ))),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ));
          },
          child: Container(
            // color: i % 2 == 0
            //     ? Colors.grey[700]!.withOpacity(0.1)
            //     : Colors.grey[600]!.withOpacity(0.1),
            child: Column(
              children: [
                        widget.i==0?const SizedBox():Divider(
                 indent: 0
                 ,color: Colors.grey[800],),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Text(
                              "${widget.e.name}",style: TextStyle(color:onhover?null: Colors.grey[500]!),)),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: Text(
                              "${widget.e.paymentMethod}",style: TextStyle(color: onhover?null: Colors.grey[500]!),)),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: Text(
                              "${widget.e.receivedAmount}",style: TextStyle(color: onhover?null: Colors.grey[500]!),)),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: Text(
                              "${widget.e.paymentDate.day}/${widget.e.paymentDate.month}/${widget.e.paymentDate.year}",style: TextStyle(color:onhover?null:  Colors.grey[500]!),)),
                      const SizedBox(
                        width: 5,
                      ),
                      // Expanded(
                      //     child: Text(managectrl
                      //         .latestpayment10[i].paymentStatus
                      //         .toString())),
                      // const SizedBox(
                      //   width: 5,
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
