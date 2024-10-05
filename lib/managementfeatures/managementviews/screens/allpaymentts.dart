import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/userpaymentmodel.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/managementcontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/pagecontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/nodatascreen.dart/nodatascreen.dart';
import 'package:xtreme_fitness/widgets/titletext.dart';

import '../../../config/const.dart';
import '../../../widgets/card.dart';
import '../../../widgets/cardborder.dart';
import '../../../widgets/headingtext.dart';
import '../../../widgets/textformwidget.dart';
import '../../managementdomain/entities.dart/paymententity.dart';
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
  List<String> d = ["All", "Success", "Failed"];
  DateTime startdatexl = DateTime.now();
  DateTime enddatexl = DateTime.now();
  @override
  void initState() {
    super.initState();
  }

  final TextEditingController _searchcontroller = TextEditingController();
  @override
  void dispose() {
    _searchcontroller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  int paymentallpos = 0;
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // const Text("All Members",style: TextStyle(fontSize: 20,),),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const HeadingText("All Payments"),
                            SizedBox(
                                height: MediaQuery.sizeOf(context).width <=
                                        mobilescreen
                                    ? 40
                                    : 50,
                                child: CardBorder(
                                    onpress: () {
                                      Get.dialog(StatefulBuilder(
                                          builder: (context, s) {
                                        return Dialog(
                                         
                                            child: SizedBox(
                                          width: 500,
                                          height: 600,
                                          child: Cardonly(
                                          margin: EdgeInsets.zero,
                                          color: Colors.grey[900],
                                            child: Padding(
                                              padding: EdgeInsets.all( MediaQuery.sizeOf(context).width<mobilescreen?16: 32),
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
                                                      HeadingText(
                                                        "Payment Reports",
                                                        size:MediaQuery.sizeOf(context).width<mobilescreen?16:20,
                                                      ),
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
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Payment Type",
                                                        style: TextStyle(
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .onPrimary
                                                                .withOpacity(
                                                                    0.5),
                                                            fontSize: 12),
                                                      ),
                                                      SizedBox(height: 10,),
                                                      SizedBox(
                                                          height: 50,
                                                          child: CardBorder(
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .onPrimary
                                                                .withOpacity(
                                                                    0.4),
                                                            margin:
                                                                EdgeInsets.zero,
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    left: 16,
                                                                    right: 8),
                                                            child:
                                                                DropdownButton(
                                                              underline:
                                                                  const SizedBox(),
                                                              value:
                                                                  paymentallpos,
                                                              hint: Text(
                                                                  d[
                                                                      paymentallpos],
                                                                  style: const TextStyle(
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis)),
                                                              items: d
                                                                  .asMap()
                                                                  .entries
                                                                  .map((e) =>
                                                                      DropdownMenuItem(
                                                                        value: e
                                                                            .key,
                                                                        child:
                                                                            Text(
                                                                          e.value,
                                                                          style: const TextStyle(
                                                                              overflow: TextOverflow.ellipsis,
                                                                              fontSize: 12),
                                                                        ),
                                                                      ))
                                                                  .toList(),
                                                              onChanged:
                                                                  (value) {
                                                                s(() {
                                                                  paymentallpos =
                                                                      value!;
                                                                });
                                                              },
                                                            ),
                                                          )),
                                                      SizedBox(
                                                        height: 16,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "Choose Start Date",
                                                                style: TextStyle(
                                                                    color: Theme.of(
                                                                            context)
                                                                        .colorScheme
                                                                        .onPrimary
                                                                        .withOpacity(
                                                                            0.5),
                                                                    fontSize:
                                                                        12),
                                                              ),
                                                              const SizedBox(
                                                                height: 6,
                                                              ),
                                                              CardBorder(
                                                                color: Theme.of(
                                                                        context)
                                                                    .colorScheme
                                                                    .onPrimary
                                                                    .withOpacity(
                                                                        0.6),
                                                                onpress: () {
                                                                  showDatePicker(
                                                                          builder:
                                                                              (context,
                                                                                  child) {
                                                                            return Theme(
                                                                                data: ThemeData(colorScheme: ColorScheme.dark(primary: Colors.blue[200]!), buttonTheme: const ButtonThemeData(buttonColor: Colors.white)),
                                                                                child: child!);
                                                                          },
                                                                          context:
                                                                              context,
                                                                          firstDate: DateTime(
                                                                              1950),
                                                                          lastDate:
                                                                              DateTime(DateTime.now().year + 1))
                                                                      .then(
                                                                    (value) {
                                                                      s(() {
                                                                        startdatexl =
                                                                            value!;
                                                                      });
                                                                    },
                                                                  );
                                                                },
                                                                padding: const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        16,
                                                                    vertical:
                                                                        12),
                                                                margin:
                                                                    EdgeInsets
                                                                        .zero,
                                                                child: Row(
                                                                  children: [
                                                                    const Text(
                                                                      "Date:",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              14),
                                                                    ),
                                                                    const SizedBox(
                                                                      width: 5,
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        const Icon(
                                                                          Icons
                                                                              .date_range,
                                                                          size:
                                                                              14,
                                                                        ),
                                                                        Text(
                                                                          "${startdatexl.day}/${startdatexl.month}/${startdatexl.year}",
                                                                          style:
                                                                              const TextStyle(fontSize: 14),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(width: 10),
                                                          MediaQuery.sizeOf(
                                                                          context)
                                                                      .width <=
                                                                  mobilescreen
                                                              ? SizedBox()
                                                              : Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      "Choose End Date",
                                                                      style: TextStyle(
                                                                          color: Theme.of(context)
                                                                              .colorScheme
                                                                              .onPrimary
                                                                              .withOpacity(
                                                                                  0.5),
                                                                          fontSize:
                                                                              12),
                                                                    ),
                                                                    const SizedBox(
                                                                      height: 6,
                                                                    ),
                                                                    CardBorder(
                                                                      color: Theme.of(
                                                                              context)
                                                                          .colorScheme
                                                                          .onPrimary
                                                                          .withOpacity(
                                                                              0.6),
                                                                      onpress:
                                                                          () {
                                                                        showDatePicker(
                                                                                builder: (context, child) {
                                                                                  return Theme(data: ThemeData(colorScheme: ColorScheme.dark(primary: Colors.blue[200]!), buttonTheme: const ButtonThemeData(buttonColor: Colors.white)), child: child!);
                                                                                },
                                                                                context: context,
                                                                                firstDate: DateTime(1950),
                                                                                lastDate: DateTime(DateTime.now().year + 1))
                                                                            .then(
                                                                          (value) {
                                                                            s(() {
                                                                              enddatexl = value!;
                                                                            });
                                                                          },
                                                                        );
                                                                      },
                                                                      padding: const EdgeInsets
                                                                          .symmetric(
                                                                          horizontal:
                                                                              16,
                                                                          vertical:
                                                                              12),
                                                                      margin: EdgeInsets
                                                                          .zero,
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          const Text(
                                                                            "Date:",
                                                                            style:
                                                                                TextStyle(fontSize: 14),
                                                                          ),
                                                                          const SizedBox(
                                                                            width:
                                                                                5,
                                                                          ),
                                                                          Row(
                                                                            children: [
                                                                              const Icon(
                                                                                Icons.date_range,
                                                                                size: 14,
                                                                              ),
                                                                              Text(
                                                                                "${enddatexl.day}/${enddatexl.month}/${enddatexl.year}",
                                                                                style: const TextStyle(fontSize: 14),
                                                                              )
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                        ],
                                                      ),
                                                      MediaQuery.sizeOf(context)
                                                                  .width >
                                                              mobilescreen
                                                          ? SizedBox()
                                                          : Row(
                                                              children: [
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      "Choose End Date",
                                                                      style: TextStyle(
                                                                          color: Theme.of(context)
                                                                              .colorScheme
                                                                              .onPrimary
                                                                              .withOpacity(
                                                                                  0.5),
                                                                          fontSize:
                                                                              12),
                                                                    ),
                                                                    const SizedBox(
                                                                      height: 6,
                                                                    ),
                                                                    CardBorder(
                                                                      color: Theme.of(
                                                                              context)
                                                                          .colorScheme
                                                                          .onPrimary
                                                                          .withOpacity(
                                                                              0.6),
                                                                      onpress:
                                                                          () {
                                                                        showDatePicker(
                                                                                builder: (context, child) {
                                                                                  return Theme(data: ThemeData(colorScheme: ColorScheme.dark(primary: Colors.blue[200]!), buttonTheme: const ButtonThemeData(buttonColor: Colors.white)), child: child!);
                                                                                },
                                                                                context: context,
                                                                                firstDate: DateTime(1950),
                                                                                lastDate: DateTime(DateTime.now().year + 1))
                                                                            .then(
                                                                          (value) {
                                                                            s(() {
                                                                              enddatexl = value!;
                                                                            });
                                                                          },
                                                                        );
                                                                      },
                                                                      padding: const EdgeInsets
                                                                          .symmetric(
                                                                          horizontal:
                                                                              16,
                                                                          vertical:
                                                                              12),
                                                                      margin: EdgeInsets
                                                                          .zero,
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          const Text(
                                                                            "Date:",
                                                                            style:
                                                                                TextStyle(fontSize: 14),
                                                                          ),
                                                                          const SizedBox(
                                                                            width:
                                                                                5,
                                                                          ),
                                                                          Row(
                                                                            children: [
                                                                              const Icon(
                                                                                Icons.date_range,
                                                                                size: 14,
                                                                              ),
                                                                              Text(
                                                                                "${enddatexl.day}/${enddatexl.month}/${enddatexl.year}",
                                                                                style: const TextStyle(fontSize: 14),
                                                                              )
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                    ],
                                                  )),
                                                  SizedBox(
                                                    width: double.maxFinite,
                                                    child: CardBorder(
                                                        margin: EdgeInsets.zero,
                                                        color: Colors.blue,
                                                        onpress: () async {
                                                          bool v = await exportPaymentDataToExcel(
                                                              returnexcelpayments(
                                                                  paymentallpos == 0
                                                                      ? managectrl.getallpayments
                                                                      : managectrl.getallpayments.where(
                                                                          (element) {
                                                                            if (paymentallpos ==
                                                                                1) {
                                                                              return element.paymentStatus!.toLowerCase() == 'success';
                                                                            } else {
                                                                              return element.paymentStatus!.toLowerCase() != 'success';
                                                                            }
                                                                          },
                                                                        ).toList(),
                                                                  startdatexl,
                                                                  enddatexl),
                                                              "Payment list");
                                                          CustomSnackbar(
                                                              context,
                                                              v
                                                                  ? "Payment Reports exported."
                                                                  : "Failed to export");
                                                        },
                                                        child: const Center(
                                                            child: Text(
                                                          "Export Excels",
                                                          style: TextStyle(
                                                              fontSize: 16),
                                                        ))),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ));
                                      }));
                                    },
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary
                                        .withOpacity(0.4),
                                    margin: EdgeInsets.zero,
                                    padding: const EdgeInsets.only(
                                        left: 16, right: 16),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: Image.asset(
                                              'assets/file.png',
                                            )),
                                        Text("Export"),
                                      ],
                                    ))),
                          ],
                        ),

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
                                  hint: "Search by Receipt# ",
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
                          child: ListView.builder(
                          itemCount: managectrl.getsearchpayments.length,
                          itemBuilder: (c, i) => ListCard(
                              payment: managectrl.getsearchpayments[i],
                              edit: () {
                                Get.dialog(Dialog(
                                  backgroundColor: Colors.grey[900],
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                            HeadingText(
                                                  "Edit Payments",size:MediaQuery.sizeOf(context).width<mobilescreen?16:null),
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
                                                      color: Theme.of(context)
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
                                                                  fontSize: 16),
                                                        ),
                                                        const SizedBox(
                                                          height: 16,
                                                        ),
                                                        DropdownMenu(
                                                            menuStyle:
                                                                MenuStyle(
                                                                    shape:
                                                                        WidgetStateProperty
                                                                            .all(
                                                                      RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8),
                                                                      ),
                                                                    ),
                                                                    backgroundColor:
                                                                        WidgetStateColor
                                                                            .resolveWith(
                                                                      (states) =>
                                                                          Colors
                                                                              .grey[800]!,
                                                                    )),
                                                            onSelected:
                                                                (index) {
                                                              setState(() {
                                                                paymentStatus =
                                                                    paymetstatusList[(index ??
                                                                            0) %
                                                                        paymetstatusList
                                                                            .length];
                                                              });
                                                            },
                                                            hintText: "Status",
                                                            dropdownMenuEntries: paymetstatusList
                                                                .asMap()
                                                                .entries
                                                                .map((e) => DropdownMenuEntry(
                                                                    value: e.key,
                                                                    label: e.value,
                                                                    style: ButtonStyle(
                                                                        backgroundColor: WidgetStateColor.resolveWith(
                                                                      (states) => Theme.of(
                                                                              context)
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
                                                onpress: () async {
                                                  Alluserpaymentmodel payments = Alluserpaymentmodel(
                                                      id: managectrl
                                                          .getsearchpayments[i]
                                                          .id,
                                                      userId: managectrl
                                                          .getsearchpayments[i]
                                                          .userId,
                                                      amount: managectrl
                                                          .getsearchpayments[i]
                                                          .amount,
                                                      receivedAmount: managectrl
                                                          .getsearchpayments[i]
                                                          .receivedAmount,
                                                      paymentDate: managectrl
                                                          .getsearchpayments[i]
                                                          .paymentDate,
                                                      transactionId: managectrl
                                                          .getsearchpayments[i]
                                                          .transactionId,
                                                      paymentStatus: paymentStatus ??
                                                          managectrl
                                                              .getsearchpayments[
                                                                  i]
                                                              .paymentStatus,
                                                      paymentMethod: managectrl
                                                          .getsearchpayments[i]
                                                          .paymentMethod,
                                                      paymentType: managectrl
                                                          .getsearchpayments[i]
                                                          .paymentType,
                                                      discountPercentage:
                                                          managectrl
                                                              .getsearchpayments[
                                                                  i]
                                                              .discountPercentage,
                                                      serviceUsageId: managectrl
                                                          .getsearchpayments[i]
                                                          .serviceUsageId,
                                                      subscriptionId: managectrl
                                                          .getsearchpayments[i]
                                                          .subscriptionId);

                                                  String s = await managectrl
                                                      .editpayments(payments);
                                                  // createAndPrintPdf(Paymententity(id: managectrl.getsearchpayments[i].id, userId: managectrl.getsearchpayments[i].userId!, amount: managectrl.getsearchpayments[i].amount!, discountPercentage: managectrl.getsearchpayments[i].discountPercentage!.toDouble(), receivedAmount: managectrl.getsearchpayments[i].receivedAmount, paymentDate: managectrl.getsearchpayments[i].paymentDate, transactionId:managectrl.getsearchpayments[i].transactionId!, paymentStatus: managectrl.getsearchpayments[i].paymentStatus!, paymentMethod:managectrl.getsearchpayments[i].paymentMethod!, paymentType: managectrl.getsearchpayments[i].paymentType!, subscriptionId: managectrl.getsearchpayments[i].subscriptionId, serviceUsageId: managectrl.getsearchpayments[i].serviceUsageId, termsAndConditions: true));
                                                  Navigator.pop(context);
                                                  CustomSnackbar(context, s);
                                                },
                                                child: const Center(
                                                    child: Text(
                                                  "Edit Payment",
                                                  style:
                                                      TextStyle(fontSize: 16),
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
                                  backgroundColor: Colors.grey[900],
                                  insetPadding: const EdgeInsets.all(16),
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
                                                MainAxisAlignment.spaceBetween,
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
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Center(
                                                    child: Container(
                                                      height: 70,
                                                      width: 70,
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: managectrl
                                                                    .getsearchpayments[
                                                                        i]
                                                                    .paymentStatus!
                                                                    .toLowerCase() ==
                                                                "success"
                                                            ? Colors.green[200]
                                                            : Colors.red[200],
                                                      ),
                                                      child: managectrl
                                                                  .getsearchpayments[
                                                                      i]
                                                                  .paymentStatus!
                                                                  .toLowerCase() ==
                                                              "success"
                                                          ? const Icon(
                                                              Icons.check,
                                                              color:
                                                                  Colors.white,
                                                              size: 40,
                                                            )
                                                          : const Icon(
                                                              Icons.dangerous,
                                                              color:
                                                                  Colors.white,
                                                              size: 40,
                                                            ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 16,
                                                  ),
                                                  Center(
                                                      child: TitleText(managectrl
                                                          .getsearchpayments[i]
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
                                                    style:
                                                        TextStyle(fontSize: 14),
                                                  ),
                                                  Text(
                                                      "${managectrl.getsearchpayments[i].paymentMethod}"),
                                                  const SizedBox(
                                                    height: 16,
                                                  ),
                                                  const Text(
                                                    "Amount",
                                                    style:
                                                        TextStyle(fontSize: 14),
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
                                                    style:
                                                        TextStyle(fontSize: 14),
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
                                                  createAndprintPdf(
                                                    Paymententity(
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
                                                            .getsearchpayments[
                                                                i]
                                                            .paymentType!,
                                                        subscriptionId: managectrl
                                                            .getsearchpayments[
                                                                i]
                                                            .subscriptionId,
                                                        serviceUsageId: managectrl
                                                            .getsearchpayments[
                                                                i]
                                                            .serviceUsageId,
                                                        termsAndConditions:
                                                            true),
                                                    // name: managectrl.getallXtremer.firstWhere((element) => element.XtremerId == managectrl.getsearchpayments[i].userId ).firstName! + managectrl.getallXtremer.firstWhere((element) => element.XtremerId == managectrl.getsearchpayments[i].userId ).surname!
                                                  );
                                                },
                                                child: const Center(
                                                    child: Text(
                                                  "Print Receipt",
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ))),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ));
                              }),
                        ).animate().slideX(begin: 1, end: 0)),
                  const SizedBox(
                    height: 40,
                  )
                ],
              );
      });
    });
  }
}

class ListCard extends StatefulWidget {
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
  State<ListCard> createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  bool onhover = false;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetxPageController>(builder: (pagectrl) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: InkWell(
          mouseCursor: MouseCursor.uncontrolled,
          onTap: () {},
          onHover: (v) {
            setState(() {
              onhover = v;
            });
          },
          child: Column(
            children: [
              Container(
                //  color: onhover?Colors.blueGrey.withOpacity(0.2):null,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Receipt#",style:TextStyle(color:Colors.grey[700])),
                          TitleText(
                            "${widget.payment.transactionId}",
                            size: 14,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text("Payment Type",style:TextStyle(color:Colors.grey[700])),
                          Text(
                              widget.payment.paymentType != null
                                  ? widget.payment.paymentType!
                                  : "",
                              style:
                                  const TextStyle()),
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
                            onPressed: widget.edit,
                            icon: const Icon(
                              Icons.edit,
                              size: 14,
                            )),
                        CardBorder(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 32),
                            margin: EdgeInsets.zero,
                            onpress: widget.userss,
                            color: Colors.blue,
                            child: const Text("View")),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                            '${widget.payment.paymentDate.day}/${widget.payment.paymentDate.month}/${widget.payment.paymentDate.year}',
                            style: const TextStyle(fontSize: 14)),
                      ],
                    )
                  ],
                ),
              ),
              Divider(
                color: Colors.white.withOpacity(0.4),
              )
            ],
          ),
        ),
      );
    });
  }
}
