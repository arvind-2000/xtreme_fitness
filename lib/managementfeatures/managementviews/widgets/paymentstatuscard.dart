import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/addmemberscontrol.dart';
import 'package:xtreme_fitness/widgets/card.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';

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
                  mainAxisAlignment: MainAxisAlignment.center,
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
                                addmemberctrl.changepaymentstatus(0);
                              },
                              icon: const Icon(Icons.close)),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        addmemberctrl.paymentstatus == 3
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
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    addmemberctrl.paymentstatus == 3
                        ? const HeadingText("Processing Payment", size: 30)
                        : addmemberctrl.paymentstatus == 1
                            ? const HeadingText(
                                "Successfull",
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
                        ? const Text("The Payment process has been started")
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
