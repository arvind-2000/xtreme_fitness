import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/addmemberscontrol.dart';
import 'package:xtreme_fitness/widgets/card.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';

import '../../managementdomain/entities.dart/paymentdetails.dart';
import '../../managementmodels/calculationusecase.dart';

class PaymentStatusCard extends StatelessWidget {
  const PaymentStatusCard({super.key, this.color, this.status = 3});

  final Color? color;
  final int status;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddMemberController>(builder: (addmemberctrl) {
      return SizedBox(
        width: 500,
        height: 600,
        child: CardwithShadow(
          color: color,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
               
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {
                                // addmemberctrl.changepaymentstatus(0);
                                
                              },
                              icon: const Icon(Icons.close)),
                        ],
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: addmemberctrl.paymentstatus==3?Colors.blue[200]:addmemberctrl.paymentstatus==1?Colors.green[200]:Colors.red[200],
                      child: addmemberctrl.paymentstatus == 3
                          ? CircularProgressIndicator(
                              color: Theme.of(context).colorScheme.onPrimary,
                            )
                          : addmemberctrl.paymentstatus == 1
                              ? const Icon(
                                  Icons.check,
                                  color: Colors.green,
                                )
                              : Icon(
                                  Icons.dangerous,
                                  color: Theme.of(context).colorScheme.error,
                                ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    addmemberctrl.paymentstatus == 3
                        ? const HeadingText("Processing Payment", size: 30)
                        : addmemberctrl.paymentstatus == 1
                            ? const HeadingText(
                                "Success",
                                size: 30,
                                color: Colors.green,
                              )
                            : addmemberctrl.paymentstatus == 2
                                ? const HeadingText("Failed", size: 30)
                                : const HeadingText("Error processing Payment",
                                    size: 30),
                    const SizedBox(
                      height: 10,
                    ),
                    addmemberctrl.paymentstatus == 3
                        ? const Text("The Payment process has been started.\n do not close or go back until the payment is completed.")
                        : addmemberctrl.paymentstatus == 1
                            ? const Text(
                                "The Payment has been successfully processed")
                            : const Text(
                                "Unfortunately the payment has been declined"),
                    const SizedBox(
                      height: 40,
                    ),
                    Divider(
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withOpacity(0.4),
                    ),
                  // addmemberctrl.paymentstatus==0?SizedBox():Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       const Text("Transaction Id"),
                  //       Text(
                  //         addmemberctrl.paymentsdetails!.transactionId,
                  //         style: const TextStyle(fontSize: 20),
                  //       ),
                  //       const SizedBox(
                  //         height: 10,
                  //       ),
                  //       const Text("Amount"),
                  //       Text(
                  //         addmemberctrl.paymentsdetails!.amount.toString(),
                  //         style: TextStyle(fontSize: 20),
                  //       ),
                  //       const SizedBox(
                  //         height: 10,
                  //       ),
                  //       const Text("Discount"),
                  //       Text(
                  //         addmemberctrl.paymentsdetails!.discountPercentage
                  //             .toString(),
                  //         style: TextStyle(fontSize: 20),
                  //       ),
                  //       const SizedBox(
                  //         height: 10,
                  //       ),
                  //       const Text("Receive Amount"),
                  //       Text(
                  //         addmemberctrl.paymentsdetails!.receivedAmount
                  //             .toString(),
                  //         style: TextStyle(fontSize: 20),
                  //       ),
                  //       const SizedBox(
                  //         height: 10,
                  //       ),
                  //     ],
                  //   ),
                  ],
                ),
              ),
              addmemberctrl.paymentstatus == 1
                  ? SizedBox(
                      width: double.maxFinite,
                      child: Cardonly(
                        onpress: (){
                          // Navigator.pop(context);
                          
                         createAndPrintPdf(PaymentDetails(id: 0, userId: addmemberctrl.paymentdetails!.userId, amount: addmemberctrl.paymentsdetails!.amount, discountPercentage: addmemberctrl.paymentdetails!.discountPercentage, receivedAmount: addmemberctrl.paymentdetails!.receivedAmount, paymentDate:addmemberctrl.paymentdetails!.paymentDate, transactionId: addmemberctrl.paymentdetails!.transactionId, paymentStatus: addmemberctrl.paymentdetails!.paymentStatus, paymentMethod: addmemberctrl.paymentdetails!.paymentMethod, paymentType:addmemberctrl.paymentdetails!.paymentType, subscriptionId:addmemberctrl.paymentdetails!.subscriptionId!,serviceUsageId: addmemberctrl.paymentdetails!.serviceUsageId));
                        },
                          color: Colors.blue[200],
                          child: const Center(child: Text("Download Receipt"))),
                    )
                  : SizedBox(),
            ],
          ),
        ),
      );
    });
  }
}
