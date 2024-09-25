import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/userpaymentmodel.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/managementcontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/pagecontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/nodatascreen.dart/nodatascreen.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/profilescreens/memberprofilescreen.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';
import 'package:xtreme_fitness/widgets/titletext.dart';

import '../../../config/const.dart';
import '../../../widgets/cardborder.dart';
import '../../../widgets/headingtext.dart';
import '../../../widgets/textformwidget.dart';
import '../../managementdomain/entities.dart/paymententity.dart';
import '../../managementdomain/entities.dart/xtremer.dart';
import '../../managementmodels/calculationusecase.dart';
import '../widgets/scaffolds.dart';

class AllPaymentScreen extends StatefulWidget {
  const AllPaymentScreen({super.key});

  @override
  State<AllPaymentScreen> createState() => _AllPaymentScreenState();
}

class _AllPaymentScreenState extends State<AllPaymentScreen> {
  String? paymentStatus;
  List<String> paymetstatusList = ["Success", "Failed", "Cancel", "Initiated"];
  @override
  void initState() {
    super.initState();
    Get.find<ManagementController>().getxtremer();
  }

  final TextEditingController _searchcontroller = TextEditingController();
  @override
  void dispose() {
    _searchcontroller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetxPageController>(builder: (pagectrl) {
      return GetBuilder<ManagementController>(builder: (managectrl) {
        return managectrl.getallpayments.isEmpty
            ? const NodataScreen(title: "Payments", desc: "No payment Records")
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // const Text("All Members",style: TextStyle(fontSize: 20,),),

                        const HeadingText("All Payments"),

                        const SizedBox(
                          height: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 60,
                              width: MediaQuery.sizeOf(context).width <
                                      mobilescreen
                                  ? double.maxFinite
                                  : 400,
                              child: TextFieldWidget(
                                  showhint: false,
                                  hint: "Search by transaction id",
                                  controller: _searchcontroller,
                                  validator: () {},
                                  onchanged: (text) {
                                    managectrl.searchpayments(text);
                                  },
                                  fieldsubmitted: () {
                                    managectrl
                                        .searchpayments(_searchcontroller.text);
                                    _searchcontroller.clear();
                                  },
                                  icon: const Icon(Icons.search)),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(managectrl.searchmessage!),
                          ],
                        ),

                        const SizedBox(
                          width: 10,
                        ),

                        // const Expanded(
                        //     child: Row(
                        //   children: [],
                        // )),
                        // Cardonly(
                        //   onpress: (){},
                        //   color: Theme.of(context).colorScheme.secondary,child: Text("Search",style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),),)
                      ],
                    ),
                  ),
                  managectrl.getsearchpayments.isEmpty
                      ? const NodataScreen(
                          title: "Payments", desc: "No payment Records")
                      : Expanded(
                          child: Center(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 600),
                            child: ListView.builder(
                              itemCount: managectrl.getsearchpayments.length,
                              itemBuilder: (c, i) => ListCard(
                                  payment: managectrl.getsearchpayments[i],
                                  edit: () {
                                    Get.dialog(Dialog(
                                      child: SizedBox(
                                        width: 500,
                                        height: 600,
                                        child: Padding(
                                          padding: const EdgeInsets.all(32),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 16,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const HeadingText(
                                                      "Edit Payments"),
                                                  IconButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
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
                                                child: managectrl.iseditpayment
                                                    ? Center(
                                                        child:
                                                            CircularProgressIndicator(
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .secondary,
                                                        ),
                                                      )
                                                    : SingleChildScrollView(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                const Text(
                                                                  "Transaction Id",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          14),
                                                                ),
                                                                const SizedBox(
                                                                  width: 10,
                                                                ),
                                                                IconButton(
                                                                    onPressed:
                                                                        () {
                                                                      Clipboard.setData(
                                                                          ClipboardData(
                                                                              text: "${managectrl.getsearchpayments[i].transactionId}"));
                                                                      CustomSnackbar(
                                                                          context,
                                                                          "Text copied to Clipboard");
                                                                    },
                                                                    icon: Icon(
                                                                      Icons
                                                                          .copy,
                                                                      size: 14,
                                                                      color: Colors
                                                                              .grey[
                                                                          300],
                                                                    ))
                                                              ],
                                                            ),
                                                            Text(
                                                                "${managectrl.getsearchpayments[i].transactionId}"),
                                                            const SizedBox(
                                                              height: 16,
                                                            ),
                                                            const SizedBox(
                                                              height: 16,
                                                            ),
                                                            const Text(
                                                              "Payment Method",
                                                              style: TextStyle(
                                                                  fontSize: 14),
                                                            ),
                                                            Text(
                                                                "${managectrl.getsearchpayments[i].paymentMethod}"),
                                                            const SizedBox(
                                                              height: 16,
                                                            ),
                                                            const Text(
                                                              "Amount",
                                                              style: TextStyle(
                                                                  fontSize: 14),
                                                            ),
                                                            Text(
                                                              "${managectrl.getsearchpayments[i].receivedAmount}",
                                                              style:
                                                                  const TextStyle(
                                                                      fontSize:
                                                                          16),
                                                            ),
                                                            const SizedBox(
                                                              height: 16,
                                                            ),
                                                            DropdownMenu(
                                                                menuStyle:
                                                                    MenuStyle(
                                                                        backgroundColor:
                                                                            WidgetStateColor
                                                                                .resolveWith(
                                                                  (states) => Theme.of(
                                                                          context)
                                                                      .colorScheme
                                                                      .primary,
                                                                )),
                                                                onSelected:
                                                                    (index) {
                                                                  setState(() {
                                                                    paymentStatus = paymetstatusList[(index ??
                                                                            0) %
                                                                        paymetstatusList
                                                                            .length];
                                                                  });
                                                                },
                                                                hintText:
                                                                    "Status",
                                                                dropdownMenuEntries: paymetstatusList
                                                                    .asMap()
                                                                    .entries
                                                                    .map((e) => DropdownMenuEntry(
                                                                        value: e.key,
                                                                        label: e.value,
                                                                        style: ButtonStyle(
                                                                            backgroundColor: WidgetStateColor.resolveWith(
                                                                          (states) => Theme.of(context)
                                                                              .colorScheme
                                                                              .primary,
                                                                        ))))
                                                                    .toList()),
                                                            const Text(
                                                              "Date",
                                                              style: TextStyle(
                                                                  fontSize: 14),
                                                            ),
                                                            Text(
                                                              "${managectrl.getsearchpayments[i].paymentDate.day}/${managectrl.getsearchpayments[i].paymentDate.month}/${managectrl.getsearchpayments[i].paymentDate.year}",
                                                              style:
                                                                  const TextStyle(
                                                                      fontSize:
                                                                          16),
                                                            ),
                                                            const SizedBox(
                                                              height: 16,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                              ),
                                              SizedBox(
                                                width: double.maxFinite,
                                                child: CardBorder(
                                                    margin: EdgeInsets.zero,
                                                    color: Colors.blue,
                                                    onpress: () async {
                                                      Alluserpaymentmodel payments = Alluserpaymentmodel(
                                                          id: managectrl
                                                              .getsearchpayments[
                                                                  i]
                                                              .id,
                                                          userId: managectrl
                                                              .getsearchpayments[
                                                                  i]
                                                              .userId,
                                                          amount: managectrl
                                                              .getsearchpayments[
                                                                  i]
                                                              .amount,
                                                          receivedAmount: managectrl
                                                              .getsearchpayments[
                                                                  i]
                                                              .receivedAmount,
                                                          paymentDate: managectrl
                                                              .getsearchpayments[
                                                                  i]
                                                              .paymentDate,
                                                          transactionId: managectrl
                                                              .getsearchpayments[
                                                                  i]
                                                              .transactionId,
                                                          paymentStatus: paymentStatus ??
                                                              managectrl
                                                                  .getsearchpayments[
                                                                      i]
                                                                  .paymentStatus,
                                                          paymentMethod: managectrl
                                                              .getsearchpayments[
                                                                  i]
                                                              .paymentMethod,
                                                          paymentType: managectrl
                                                              .getsearchpayments[
                                                                  i]
                                                              .paymentType,
                                                          discountPercentage: managectrl
                                                              .getsearchpayments[
                                                                  i]
                                                              .discountPercentage,
                                                          serviceUsageId: managectrl.getsearchpayments[i].serviceUsageId,
                                                          subscriptionId: managectrl.getsearchpayments[i].subscriptionId);

                                                      String s =
                                                          await managectrl
                                                              .editpayments(
                                                                  payments);
                                                      // createAndPrintPdf(Paymententity(id: managectrl.getsearchpayments[i].id, userId: managectrl.getsearchpayments[i].userId!, amount: managectrl.getsearchpayments[i].amount!, discountPercentage: managectrl.getsearchpayments[i].discountPercentage!.toDouble(), receivedAmount: managectrl.getsearchpayments[i].receivedAmount, paymentDate: managectrl.getsearchpayments[i].paymentDate, transactionId:managectrl.getsearchpayments[i].transactionId!, paymentStatus: managectrl.getsearchpayments[i].paymentStatus!, paymentMethod:managectrl.getsearchpayments[i].paymentMethod!, paymentType: managectrl.getsearchpayments[i].paymentType!, subscriptionId: managectrl.getsearchpayments[i].subscriptionId, serviceUsageId: managectrl.getsearchpayments[i].serviceUsageId, termsAndConditions: true));
                                                      Navigator.pop(context);
                                                      CustomSnackbar(
                                                          context, s);
                                                    },
                                                    child: const Center(
                                                        child: Text(
                                                      "Edit Payment",
                                                      style: TextStyle(
                                                          fontSize: 16),
                                                    ))),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ));
                                  },
                                  userss: () {
                                    Get.dialog(Dialog(
                                      child: SizedBox(
                                        width: 500,
                                        height: 600,
                                        child: Padding(
                                          padding: const EdgeInsets.all(32),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 16,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const HeadingText(
                                                      "Payment Details"),
                                                  IconButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
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
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Center(
                                                        child: Container(
                                                          height: 70,
                                                          width: 70,
                                                          alignment:
                                                              Alignment.center,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: managectrl
                                                                        .getsearchpayments[
                                                                            i]
                                                                        .paymentStatus!
                                                                        .toLowerCase() ==
                                                                    "success"
                                                                ? Colors
                                                                    .green[200]
                                                                : Colors
                                                                    .red[200],
                                                          ),
                                                          child: managectrl
                                                                      .getsearchpayments[
                                                                          i]
                                                                      .paymentStatus!
                                                                      .toLowerCase() ==
                                                                  "success"
                                                              ? const Icon(
                                                                  Icons.check,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 40,
                                                                )
                                                              : const Icon(
                                                                  Icons
                                                                      .dangerous,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 40,
                                                                ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 16,
                                                      ),
                                                      Center(
                                                          child: TitleText(managectrl
                                                              .getsearchpayments[
                                                                  i]
                                                              .paymentStatus!
                                                              .toUpperCase())),
                                                      Divider(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .onPrimary
                                                            .withOpacity(0.6),
                                                      ),
                                                      Row(
                                                        children: [
                                                          const Text(
                                                            "Transaction Id",
                                                            style: TextStyle(
                                                                fontSize: 14),
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          IconButton(
                                                              onPressed: () {
                                                                Clipboard.setData(
                                                                    ClipboardData(
                                                                        text:
                                                                            "${managectrl.getsearchpayments[i].transactionId}"));
                                                                CustomSnackbar(
                                                                    context,
                                                                    "Text copied to Clipboard");
                                                              },
                                                              icon: Icon(
                                                                Icons.copy,
                                                                size: 14,
                                                                color: Colors
                                                                    .grey[300],
                                                              ))
                                                        ],
                                                      ),
                                                      Text(
                                                          "${managectrl.getsearchpayments[i].transactionId}"),
                                                      const SizedBox(
                                                        height: 16,
                                                      ),
                                                      const SizedBox(
                                                        height: 16,
                                                      ),
                                                      const Text(
                                                        "Payment Method",
                                                        style: TextStyle(
                                                            fontSize: 14),
                                                      ),
                                                      Text(
                                                          "${managectrl.getsearchpayments[i].paymentMethod}"),
                                                      const SizedBox(
                                                        height: 16,
                                                      ),
                                                      const Text(
                                                        "Amount",
                                                        style: TextStyle(
                                                            fontSize: 14),
                                                      ),
                                                      Text(
                                                        "${managectrl.getsearchpayments[i].receivedAmount}",
                                                        style: const TextStyle(
                                                            fontSize: 16),
                                                      ),
                                                      const SizedBox(
                                                        height: 16,
                                                      ),
                                                      const Text(
                                                        "Date",
                                                        style: TextStyle(
                                                            fontSize: 14),
                                                      ),
                                                      Text(
                                                        "${managectrl.getsearchpayments[i].paymentDate.day}/${managectrl.getsearchpayments[i].paymentDate.month}/${managectrl.getsearchpayments[i].paymentDate.year}",
                                                        style: const TextStyle(
                                                            fontSize: 16),
                                                      ),
                                                      const SizedBox(
                                                        height: 16,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: double.maxFinite,
                                                child: CardBorder(
                                                    margin: EdgeInsets.zero,
                                                    color: Colors.blue,
                                                    onpress: () {
                                                      createAndPrintPdf(Paymententity(
                                                          id: managectrl
                                                              .getsearchpayments[
                                                                  i]
                                                              .id,
                                                          userId: managectrl
                                                              .getsearchpayments[
                                                                  i]
                                                              .userId!,
                                                          amount: managectrl
                                                              .getsearchpayments[
                                                                  i]
                                                              .amount!,
                                                          discountPercentage: managectrl
                                                              .getsearchpayments[
                                                                  i]
                                                              .discountPercentage!
                                                              .toDouble(),
                                                          receivedAmount: managectrl
                                                              .getsearchpayments[
                                                                  i]
                                                              .receivedAmount,
                                                          paymentDate: managectrl
                                                              .getsearchpayments[
                                                                  i]
                                                              .paymentDate,
                                                          transactionId: managectrl
                                                              .getsearchpayments[
                                                                  i]
                                                              .transactionId!,
                                                          paymentStatus: managectrl
                                                              .getsearchpayments[
                                                                  i]
                                                              .paymentStatus!,
                                                          paymentMethod: managectrl
                                                              .getsearchpayments[
                                                                  i]
                                                              .paymentMethod!,
                                                          paymentType: managectrl
                                                              .getsearchpayments[i]
                                                              .paymentType!,
                                                          subscriptionId: managectrl.getsearchpayments[i].subscriptionId,
                                                          serviceUsageId: managectrl.getsearchpayments[i].serviceUsageId,
                                                          termsAndConditions: true));
                                                    },
                                                    child: const Center(
                                                        child: Text(
                                                      "Print Receipt",
                                                      style: TextStyle(
                                                          fontSize: 16),
                                                    ))),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ));
                                  }),
                            ).animate().slideX(begin: 1, end: 0),
                          ),
                        )),
                  const SizedBox(
                    height: 40,
                  )
                ],
              );
      });
    });
  }
}

class ListCard extends StatelessWidget {
  const ListCard({
    super.key,
    required this.payment,
    required this.userss,
    this.edit,
  });

  final Alluserpaymentmodel payment;
  final VoidCallback userss;
  final VoidCallback? edit;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetxPageController>(builder: (pagectrl) {
      return CardwithShadow(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleText(
                      "Id:${payment.transactionId}",
                      size: 16,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Payment Type"),
                    Text(
                        payment.paymentType != null ? payment.paymentType! : "",
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 6,
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: edit,
                      icon: const Icon(
                        Icons.edit,
                        size: 14,
                      )),
                  CardBorder(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 32),
                      margin: EdgeInsets.zero,
                      onpress: userss,
                      color: Colors.blue,
                      child: const Text("View")),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                      '${payment.paymentDate.day}/${payment.paymentDate.month}/${payment.paymentDate.year}',
                      style: const TextStyle(fontSize: 14)),
                ],
              )
            ],
          ));
    });
  }
}
