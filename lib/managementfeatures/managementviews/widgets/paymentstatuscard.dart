import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/addmemberscontrol.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';

import '../../../widgets/cardborder.dart';
import '../../managementmodels/calculationusecase.dart';
import 'package:lottie/lottie.dart';

class PaymentStatusCard extends StatelessWidget {
  const PaymentStatusCard(
      {super.key, this.color, this.status = 3, required this.callback});

  final Color? color;
  final int status;
  final VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddMemberController>(builder: (addmemberctrl) {
      return SizedBox(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500, maxHeight: 600),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    addmemberctrl.paymentstatus == 3 ||
                            addmemberctrl.paymentstatus == 0
                        ? const SizedBox()
                        : Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    onPressed: callback,
                                    icon: const Icon(Icons.close)),
                              ],
                            ),
                          ),
                    Container(
                      height: 200,
                      width: 200,
                      padding: const EdgeInsets.all(10),
                      decoration: addmemberctrl.paymentstatus == 3
                          ? null
                          : BoxDecoration(
                              shape: BoxShape.circle,
                              color: addmemberctrl.paymentstatus == 3
                                  ? Colors.blue[200]
                                  : addmemberctrl.paymentstatus == 1
                                      ? Colors.green[200]
                                      : Colors.red[200],
                            ),
                      child: addmemberctrl.paymentstatus == 3 ||
                              addmemberctrl.paymentstatus == 0
                          ? Lottie.asset('assets/images/payloading.json')
                          : addmemberctrl.paymentstatus == 1
                              ? const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 80,
                                )
                              : Icon(
                                  addmemberctrl.paymentstatus == 4
                                      ? Icons.cancel
                                      : Icons.dangerous,
                                  color: Colors.white,
                                  size: 80,
                                ),
                    ),
                    addmemberctrl.paymentstatus == 3
                        ? const HeadingText("Processing Payment", size: 30)
                        : addmemberctrl.paymentstatus == 1
                            ? const HeadingText(
                                "Success",
                                size: 30,
                                color: Colors.green,
                              )
                            : addmemberctrl.paymentstatus == 4
                                ? const HeadingText("Cancelled", size: 30)
                                : addmemberctrl.paymentstatus == 2
                                    ? const HeadingText("Failed", size: 30)
                                    : addmemberctrl.paymentstatus == 3
                                        ? const HeadingText(
                                            "Processing Payment",
                                            size: 30)
                                        : addmemberctrl.paymentstatus == 5
                                            ? const HeadingText(
                                                "Failed to Create User",
                                                size: 30)
                                            : const HeadingText(
                                                "Error processing Payment",
                                                size: 30),
                    const SizedBox(
                      height: 10,
                    ),
                    addmemberctrl.paymentstatus == 3 ||
                            addmemberctrl.paymentstatus == 0
                        ? const Center(
                            child: Text(
                                textAlign: TextAlign.center,
                                "The Payment process has been started.\n Do not close or go back until the payment is completed."),
                          )
                        : addmemberctrl.paymentstatus == 1
                            ? const Text(
                                "The Payment has been successfully processed")
                            : addmemberctrl.paymentstatus == 4
                                ? const Text(
                                    "Unfortunately the payment has been cancelled by the user.")
                                : addmemberctrl.paymentstatus == 5
                                    ? const Text(
                                        textAlign: TextAlign.center,
                                        "Error creating Xtremer.\nTry Again")
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
                  ],
                ),
                addmemberctrl.paymentstatus == 1
                    ? SizedBox(
                        width: double.maxFinite,
                        child: CardBorder(
                            onpress: () {
                              // Navigator.pop(context);

                              createAndprintPdf(addmemberctrl.paymentsdetails!,
                                  name:
                                      '${addmemberctrl.authctrl.getuser!.userName}');
                            },
                            color: Colors.blue,
                            child:
                                const Center(child: Text("Download Receipt"))),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
