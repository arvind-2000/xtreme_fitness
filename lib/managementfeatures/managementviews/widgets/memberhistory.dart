import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';
import 'package:xtreme_fitness/widgets/titletext.dart';

import '../../../widgets/card.dart';
import '../../../widgets/cardborder.dart';
import '../../../widgets/headingtext.dart';
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
                                                    CustomSnackbar(context,
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
                                            Text(
                                              "${e.transactionId}",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.grey[500]),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    const Text("Payment Method"),
                                    Text(
                                      "${e.paymentMethod}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[300]),
                                    ),
                                    const SizedBox(height: 10),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    CardBorder(
                                        margin: EdgeInsets.zero,
                                        color: Colors.green,
                                        onpress: () {
                                          createAndprintPdf(
                                            Paymententity(
                                                id: e.id,
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
                                            // name: managectrl.xtremer!.firstName!+managectrl.xtremer!.surname!
                                          );
                                        },
                                        child: const Text(
                                          "Download PDF",
                                          style: TextStyle(fontSize: 14),
                                        )),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Text(
                                      "${e.paymentDate.day} / ${e.paymentDate.month} /${e.paymentDate.year}",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary),
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
