import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/paymenttrans.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/editcontactinfo/contactcontroller.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';
import 'package:xtreme_fitness/widgets/titletext.dart';

import '../../../landingpages/sections/home/homedesktop.dart';
import '../../../widgets/cardborder.dart';
import '../../managementdomain/entities.dart/paymententity.dart';
import '../../managementdomain/entities.dart/xtremer.dart';
import '../../managementmodels/calculationusecase.dart';
import '../controllers/managementcontroller.dart';
import 'scaffolds.dart';

class MemberServiceHistory extends StatelessWidget {
  const MemberServiceHistory({
    super.key,
    required this.xtremers,
  });

  final Xtremer xtremers;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ManagementController>(builder: (managectrl) {
      return managectrl.getallpayments
              .where((element) =>
                  element.userId == xtremers.XtremerId &&
                  element.paymentStatus!.toLowerCase() == "success")
              .toList()
              .isEmpty
          ? TitleText(
              "No service to show",
              color: Colors.grey[600],
            )
          : ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: ListView(
                  shrinkWrap: true,
                  // element.userId==managectrl.xtremer!.XtremerId && element.paymentStatus!.toLowerCase()=="success",
                  children: managectrl.getallpayments
                      .where((element) =>
                          element.userId == xtremers.XtremerId &&
                          element.paymentStatus!.toLowerCase() == "success")
                      .map(
                        (e) => CardwithShadow(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                const Text("Transaction ID"),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                IconButton(
                                                  onPressed: () {
                                                    Clipboard.setData(ClipboardData(
                                                        text:
                                                            "${e.transactionId}"));
                                                    CustomSnackbar(
                                                        "Text copied to Clipboard");
                                                  },
                                                  icon: const Icon(
                                                    Icons.copy,
                                                    size: 14,
                                                  ),
                                                  tooltip:
                                                      "Copy transaction id",
                                                )
                                              ],
                                            ),
                                            UnderLineText(
                                             text: "${e.transactionId}",
                                              // style: TextStyle(
                                              //     fontSize: 16,
                                              //     color: Colors.grey[500]),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    const Text("Payment Type"),
                                    Text(
                                      "${e.paymentType?.split("+").join()}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[400]),
                                    ),
                                    const SizedBox(height: 10),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    CardBorder(
                                        margin: EdgeInsets.zero,
                                        padding:EdgeInsets.symmetric(vertical:8,horizontal:16),
                                        color: Colors.grey[500],
                                        onpress: () {
                                          createAndprintPdf(
                                           
                                            PaymentByTransaction(
                                                id: e.id,
                                                fullName: '${managectrl.xtremer?.firstName!} ${managectrl.xtremer?.surname}',
                                                userId: e.userId!,
                                                amount: e.amount!,
                                                discountPercentage: e
                                                    .discountPercentage!
                                                    .toDouble(),
                                                receivedAmount:
                                                    e.receivedAmount,
                                                paymentDate: e.paymentDate,
                                                transactionId: e.transactionId!,
                                                paymentStatus: e.paymentStatus!,
                                                paymentMethod: e.paymentMethod!,
                                                paymentType: e.paymentType!,
                                                subscriptionId:
                                                    e.subscriptionId,
                                                serviceUsageId:
                                                    e.serviceUsageId,
                                                termsAndConditions: true),
                                        
                                            // name: 
                                          );
                                        },
                                        child: const Text(
                                          "Download PDF",
                                          style: TextStyle(fontSize: 12),
                                        )),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      "${e.paymentDate.day} / ${e.paymentDate.month} /${e.paymentDate.year}",
                                      style: TextStyle(
                                          color: Colors.grey[500]),
                                    )
                                  ],
                                ),
                              ],
                            )),
                      )
                      .toList()),
            );
    });
  }
}
