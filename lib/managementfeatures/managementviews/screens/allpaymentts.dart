import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/userpaymentmodel.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/managementcontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/pagecontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/editcontactinfo/contactcontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/nodatascreen.dart/nodatascreen.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';
import 'package:xtreme_fitness/widgets/titletext.dart';

import '../../../config/const.dart';
import '../../../widgets/card.dart';
import '../../../widgets/cardborder.dart';
import '../../../widgets/headingtext.dart';
import '../../../widgets/textformwidget.dart';
import '../../managementdomain/entities.dart/paymenttrans.dart';
import '../../managementmodels/calculationusecase.dart';
import '../widgets/scaffolds.dart';

class AllPaymentScreen extends StatefulWidget {
  const AllPaymentScreen({super.key});

  @override
  State<AllPaymentScreen> createState() => _AllPaymentScreenState();
}
  List<String> paymetstatusList = ["Success", "Failed", "Cancel", "Initiated"];
class _AllPaymentScreenState extends State<AllPaymentScreen> {
  String? paymentStatus;

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
                                              padding: EdgeInsets.all(
                                                  MediaQuery.sizeOf(context)
                                                              .width <
                                                          mobilescreen
                                                      ? 16
                                                      : 32),
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
                                                        size: MediaQuery.sizeOf(
                                                                        context)
                                                                    .width <
                                                                mobilescreen
                                                            ? 16
                                                            : 20,
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
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
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
                                                      const SizedBox(
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
                                                          const SizedBox(
                                                              width: 10),
                                                          MediaQuery.sizeOf(
                                                                          context)
                                                                      .width <=
                                                                  mobilescreen
                                                              ? const SizedBox()
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
                                                          ? const SizedBox()
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
                                        const Text("Export"),
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
                          title: "Payments", desc: "No payment Records"):Expanded(child: SfDataGridTheme(
                                      data: SfDataGridThemeData(
                gridLineColor: Colors.grey[700],
                filterIconColor: Colors.grey[600],
                gridLineStrokeWidth: 0.5
              ),

                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: SfDataGrid(source: PaymentGridSource(context, managectrl: managectrl),
                                                      allowTriStateSorting: true,
                                                      allowSorting: true,   
                                                      gridLinesVisibility: GridLinesVisibility.both,
                                                        footerHeight: 50,
                                                       columnWidthMode: ColumnWidthMode.fill,
                                                       
                                    
                                      columns:  <GridColumn>[
                              
                                                        GridColumn(
                                                          
                                                            maximumWidth: 180,
                                                            columnName: 'Receipt',
                                                           allowSorting: false,
                                                            label: Container(
                                      padding: const EdgeInsets.all(8.0),
                                      alignment: Alignment.center,
                                      child: const Text(
                                        'Receipt',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ))),
                                          GridColumn(
                                                            allowSorting: true,
                                                            maximumWidth: 180,
                                                            columnName: 'Name',
                                                          
                                                            label: Container(
                                      padding: const EdgeInsets.all(8.0),
                                      alignment: Alignment.center,
                                      child: const Text(
                                        'Name',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ))),
                                         GridColumn(
                                                            maximumWidth: 180,
                                                            allowSorting: false,
                                                            columnName: 'Type',
                                                            label: Container(
                                      padding: const EdgeInsets.all(8.0),
                                      alignment: Alignment.center,
                                      child: const Text(
                                        'Type',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ))),
                                                        GridColumn(
                                                            maximumWidth: 180,
                                                            allowSorting: false,
                                                            columnName: 'Method',
                                                            label: Container(
                                      padding: const EdgeInsets.all(8.0),
                                      alignment: Alignment.center,
                                      child: const Text(
                                        'Method',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ))),
                                                        GridColumn(
                                                            maximumWidth: 140,
                                                            allowSorting: true,
                                                            columnName: 'Date',
                                                            label: Container(
                                      padding: const EdgeInsets.all(8.0),
                                      alignment: Alignment.center,
                                      child: const Text(
                                        'Date',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ))),
                                          
                                                        GridColumn(
                                                          allowSorting: false,
                                                            maximumWidth: 140,
                                                            columnName: 'Status',
                                                            label: Container(
                                      padding: const EdgeInsets.all(8.0),
                                      alignment: Alignment.center,
                                      child: const Text(
                                        'Status',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ))),
                                                        // Add the Action column
                                                        GridColumn(
                                                            // maximumWidth: 200,
                                                            allowSorting: false,
                                                            columnName: 'Actions',
                                                            label: Container(
                                      padding: const EdgeInsets.all(8.0),
                                      alignment: Alignment.center,
                                      child: const Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Actions',
                                            style: TextStyle(fontWeight: FontWeight.bold),
                                          ),
                                        
                                           
                                        ],
                                      ))),
                                                      ],),
                            ),
                          )),
                      // : Expanded(
                      //     child: ListView.builder(
                      //     itemCount: managectrl.getsearchpayments.length,
                      //     itemBuilder: (c, i) => ListCard(
                      //         payment: managectrl.getsearchpayments[i],
                      //         edit: () {
                      //           Get.dialog(Dialog(
                      //             backgroundColor: Colors.grey[900],
                      //             child: SizedBox(
                      //               width: 500,
                      //               height: 600,
                      //               child: Padding(
                      //                 padding: const EdgeInsets.all(32),
                      //                 child: Column(
                      //                   crossAxisAlignment:
                      //                       CrossAxisAlignment.start,
                      //                   children: [
                      //                     const SizedBox(
                      //                       height: 16,
                      //                     ),
                      //                     Row(
                      //                       mainAxisAlignment:
                      //                           MainAxisAlignment.spaceBetween,
                      //                       children: [
                      //                         HeadingText("Edit Payments",
                      //                             size:
                      //                                 MediaQuery.sizeOf(context)
                      //                                             .width <
                      //                                         mobilescreen
                      //                                     ? 16
                      //                                     : null),
                      //                         IconButton(
                      //                             onPressed: () {
                      //                               Navigator.pop(context);
                      //                             },
                      //                             icon: const Icon(
                      //                               Icons.close,
                      //                               size: 16,
                      //                             ))
                      //                       ],
                      //                     ),
                      //                     const SizedBox(
                      //                       height: 16,
                      //                     ),
                      //                     Expanded(
                      //                       child: managectrl.iseditpayment
                      //                           ? Center(
                      //                               child:
                      //                                   CircularProgressIndicator(
                      //                                 color: Theme.of(context)
                      //                                     .colorScheme
                      //                                     .secondary,
                      //                               ),
                      //                             )
                      //                           : SingleChildScrollView(
                      //                               child: Column(
                      //                                 crossAxisAlignment:
                      //                                     CrossAxisAlignment
                      //                                         .start,
                      //                                 children: [
                      //                                   Row(
                      //                                     children: [
                      //                                       const Text(
                      //                                         "Transaction Id",
                      //                                         style: TextStyle(
                      //                                             fontSize: 14),
                      //                                       ),
                      //                                       const SizedBox(
                      //                                         width: 10,
                      //                                       ),
                      //                                       IconButton(
                      //                                           onPressed: () {
                      //                                             Clipboard.setData(
                      //                                                 ClipboardData(
                      //                                                     text:
                      //                                                         "${managectrl.getsearchpayments[i].transactionId}"));
                      //                                             CustomSnackbar(
                                                                    
                      //                                                 "Text copied to Clipboard");
                      //                                           },
                      //                                           icon: Icon(
                      //                                             Icons.copy,
                      //                                             size: 14,
                      //                                             color: Colors
                      //                                                     .grey[
                      //                                                 300],
                      //                                           ))
                      //                                     ],
                      //                                   ),
                      //                                   Text(
                      //                                       "${managectrl.getsearchpayments[i].transactionId}"),
                      //                                   const SizedBox(
                      //                                     height: 16,
                      //                                   ),
                      //                                   const SizedBox(
                      //                                     height: 16,
                      //                                   ),
                      //                                   const Text(
                      //                                     "Payment Method",
                      //                                     style: TextStyle(
                      //                                         fontSize: 14),
                      //                                   ),
                      //                                   Text(
                      //                                       "${managectrl.getsearchpayments[i].paymentMethod}"),
                      //                                   const SizedBox(
                      //                                     height: 16,
                      //                                   ),
                      //                                   const Text(
                      //                                     "Amount",
                      //                                     style: TextStyle(
                      //                                         fontSize: 14),
                      //                                   ),
                      //                                   Text(
                      //                                     "${managectrl.getsearchpayments[i].receivedAmount}",
                      //                                     style:
                      //                                         const TextStyle(
                      //                                             fontSize: 16),
                      //                                   ),
                      //                                   const SizedBox(
                      //                                     height: 16,
                      //                                   ),
                      //                                   DropdownMenu(
                      //                                       menuStyle:
                      //                                           MenuStyle(
                      //                                               shape:
                      //                                                   WidgetStateProperty
                      //                                                       .all(
                      //                                                 RoundedRectangleBorder(
                      //                                                   borderRadius:
                      //                                                       BorderRadius.circular(8),
                      //                                                 ),
                      //                                               ),
                      //                                               backgroundColor:
                      //                                                   WidgetStateColor
                      //                                                       .resolveWith(
                      //                                                 (states) =>
                      //                                                     Colors
                      //                                                         .grey[800]!,
                      //                                               )),
                      //                                       onSelected:
                      //                                           (index) {
                      //                                         setState(() {
                      //                                           paymentStatus =
                      //                                               paymetstatusList[(index ??
                      //                                                       0) %
                      //                                                   paymetstatusList
                      //                                                       .length];
                      //                                         });
                      //                                       },
                      //                                       hintText: "Status",
                      //                                       dropdownMenuEntries: paymetstatusList
                      //                                           .asMap()
                      //                                           .entries
                      //                                           .map((e) => DropdownMenuEntry(
                      //                                               value: e.key,
                      //                                               label: e.value,
                      //                                               style: ButtonStyle(
                      //                                                   backgroundColor: WidgetStateColor.resolveWith(
                      //                                                 (states) => Theme.of(
                      //                                                         context)
                      //                                                     .colorScheme
                      //                                                     .primary,
                      //                                               ))))
                      //                                           .toList()),
                      //                                   const Text(
                      //                                     "Date",
                      //                                     style: TextStyle(
                      //                                         fontSize: 14),
                      //                                   ),
                      //                                   Text(
                      //                                     "${managectrl.getsearchpayments[i].paymentDate.day}/${managectrl.getsearchpayments[i].paymentDate.month}/${managectrl.getsearchpayments[i].paymentDate.year}",
                      //                                     style:
                      //                                         const TextStyle(
                      //                                             fontSize: 16),
                      //                                   ),
                      //                                   const SizedBox(
                      //                                     height: 16,
                      //                                   ),
                      //                                 ],
                      //                               ),
                      //                             ),
                      //                     ),
                      //                     SizedBox(
                      //                       width: double.maxFinite,
                      //                       child: CardBorder(
                      //                           margin: EdgeInsets.zero,
                      //                           color: Colors.blue,
                      //                           onpress: () async {
                      //                             Alluserpaymentmodel payments = Alluserpaymentmodel(
                      //                                 id: managectrl
                      //                                     .getsearchpayments[i]
                      //                                     .id,
                      //                                 userId: managectrl
                      //                                     .getsearchpayments[i]
                      //                                     .userId,
                      //                                 amount: managectrl
                      //                                     .getsearchpayments[i]
                      //                                     .amount,
                      //                                 receivedAmount: managectrl
                      //                                     .getsearchpayments[i]
                      //                                     .receivedAmount,
                      //                                 paymentDate: managectrl
                      //                                     .getsearchpayments[i]
                      //                                     .paymentDate,
                      //                                 transactionId: managectrl
                      //                                     .getsearchpayments[i]
                      //                                     .transactionId,
                      //                                 paymentStatus: paymentStatus ??
                      //                                     managectrl
                      //                                         .getsearchpayments[
                      //                                             i]
                      //                                         .paymentStatus,
                      //                                 paymentMethod: managectrl
                      //                                     .getsearchpayments[i]
                      //                                     .paymentMethod,
                      //                                 paymentType: managectrl
                      //                                     .getsearchpayments[i]
                      //                                     .paymentType,
                      //                                 discountPercentage:
                      //                                     managectrl
                      //                                         .getsearchpayments[
                      //                                             i]
                      //                                         .discountPercentage,
                      //                                 serviceUsageId: managectrl
                      //                                     .getsearchpayments[i]
                      //                                     .serviceUsageId,
                      //                                 subscriptionId: managectrl
                      //                                     .getsearchpayments[i]
                      //                                     .subscriptionId);

                      //                             String s = await managectrl
                      //                                 .editpayments(payments);
                      //                             // createAndPrintPdf(Paymententity(id: managectrl.getsearchpayments[i].id, userId: managectrl.getsearchpayments[i].userId!, amount: managectrl.getsearchpayments[i].amount!, discountPercentage: managectrl.getsearchpayments[i].discountPercentage!.toDouble(), receivedAmount: managectrl.getsearchpayments[i].receivedAmount, paymentDate: managectrl.getsearchpayments[i].paymentDate, transactionId:managectrl.getsearchpayments[i].transactionId!, paymentStatus: managectrl.getsearchpayments[i].paymentStatus!, paymentMethod:managectrl.getsearchpayments[i].paymentMethod!, paymentType: managectrl.getsearchpayments[i].paymentType!, subscriptionId: managectrl.getsearchpayments[i].subscriptionId, serviceUsageId: managectrl.getsearchpayments[i].serviceUsageId, termsAndConditions: true));
                      //                             Navigator.pop(context);
                      //                             CustomSnackbar( s);
                      //                           },
                      //                           child: const Center(
                      //                               child: Text(
                      //                             "Edit Payment",
                      //                             style:
                      //                                 TextStyle(fontSize: 16),
                      //                           ))),
                      //                     ),
                      //                   ],
                      //                 ),
                      //               ),
                      //             ),
                      //           ));
                      //         },
                      //         userss: () {
                      //           Get.dialog(Dialog(
                      //             backgroundColor: Colors.grey[900],
                      //             insetPadding: const EdgeInsets.all(16),
                      //             child: SizedBox(
                      //               width: 500,
                      //               height: 600,
                      //               child: Padding(
                      //                 padding: const EdgeInsets.all(32),
                      //                 child: Column(
                      //                   crossAxisAlignment:
                      //                       CrossAxisAlignment.start,
                      //                   children: [
                      //                     const SizedBox(
                      //                       height: 16,
                      //                     ),
                      //                     Row(
                      //                       mainAxisAlignment:
                      //                           MainAxisAlignment.spaceBetween,
                      //                       children: [
                      //                         const HeadingText(
                      //                             "Payment Details"),
                      //                         IconButton(
                      //                             onPressed: () {
                      //                               Navigator.pop(context);
                      //                             },
                      //                             icon: const Icon(
                      //                               Icons.close,
                      //                               size: 16,
                      //                             ))
                      //                       ],
                      //                     ),
                      //                     const SizedBox(
                      //                       height: 16,
                      //                     ),
                      //                     Expanded(
                      //                       child: SingleChildScrollView(
                      //                         child: Column(
                      //                           crossAxisAlignment:
                      //                               CrossAxisAlignment.start,
                      //                           children: [
                      //                             Center(
                      //                               child: Container(
                      //                                 height: 70,
                      //                                 width: 70,
                      //                                 alignment:
                      //                                     Alignment.center,
                      //                                 decoration: BoxDecoration(
                      //                                   shape: BoxShape.circle,
                      //                                   color: managectrl
                      //                                               .getsearchpayments[
                      //                                                   i]
                      //                                               .paymentStatus!
                      //                                               .toLowerCase() ==
                      //                                           "success"
                      //                                       ? Colors.green[200]
                      //                                       : Colors.red[200],
                      //                                 ),
                      //                                 child: managectrl
                      //                                             .getsearchpayments[
                      //                                                 i]
                      //                                             .paymentStatus!
                      //                                             .toLowerCase() ==
                      //                                         "success"
                      //                                     ? const Icon(
                      //                                         Icons.check,
                      //                                         color:
                      //                                             Colors.white,
                      //                                         size: 40,
                      //                                       )
                      //                                     : const Icon(
                      //                                         Icons.dangerous,
                      //                                         color:
                      //                                             Colors.white,
                      //                                         size: 40,
                      //                                       ),
                      //                               ),
                      //                             ),
                      //                             const SizedBox(
                      //                               height: 16,
                      //                             ),
                      //                             Center(
                      //                                 child: TitleText(managectrl
                      //                                     .getsearchpayments[i]
                      //                                     .paymentStatus!
                      //                                     .toUpperCase())),
                      //                             Divider(
                      //                               color: Theme.of(context)
                      //                                   .colorScheme
                      //                                   .onPrimary
                      //                                   .withOpacity(0.6),
                      //                             ),
                      //                             Row(
                      //                               children: [
                      //                                 const Text(
                      //                                   "Transaction Id",
                      //                                   style: TextStyle(
                      //                                       fontSize: 14),
                      //                                 ),
                      //                                 const SizedBox(
                      //                                   width: 10,
                      //                                 ),
                      //                                 IconButton(
                      //                                     onPressed: () {
                      //                                       Clipboard.setData(
                      //                                           ClipboardData(
                      //                                               text:
                      //                                                   "${managectrl.getsearchpayments[i].transactionId}"));
                      //                                       CustomSnackbar(
                                                         
                      //                                           "Text copied to Clipboard");
                      //                                     },
                      //                                     icon: Icon(
                      //                                       Icons.copy,
                      //                                       size: 14,
                      //                                       color: Colors
                      //                                           .grey[300],
                      //                                     ))
                      //                               ],
                      //                             ),
                      //                             Text(
                      //                                 "${managectrl.getsearchpayments[i].transactionId}"),
                      //                             const SizedBox(
                      //                               height: 16,
                      //                             ),
                      //                             const SizedBox(
                      //                               height: 16,
                      //                             ),
                      //                             const Text(
                      //                               "Payment Method",
                      //                               style:
                      //                                   TextStyle(fontSize: 14),
                      //                             ),
                      //                             Text(
                      //                                 "${managectrl.getsearchpayments[i].paymentMethod}"),
                      //                             const SizedBox(
                      //                               height: 16,
                      //                             ),
                      //                             const Text(
                      //                               "Amount",
                      //                               style:
                      //                                   TextStyle(fontSize: 14),
                      //                             ),
                      //                             Text(
                      //                               "${managectrl.getsearchpayments[i].receivedAmount}",
                      //                               style: const TextStyle(
                      //                                   fontSize: 16),
                      //                             ),
                      //                             const SizedBox(
                      //                               height: 16,
                      //                             ),
                      //                             const Text(
                      //                               "Date",
                      //                               style:
                      //                                   TextStyle(fontSize: 14),
                      //                             ),
                      //                             Text(
                      //                               "${managectrl.getsearchpayments[i].paymentDate.day}/${managectrl.getsearchpayments[i].paymentDate.month}/${managectrl.getsearchpayments[i].paymentDate.year}",
                      //                               style: const TextStyle(
                      //                                   fontSize: 16),
                      //                             ),
                      //                             const SizedBox(
                      //                               height: 16,
                      //                             ),
                      //                           ],
                      //                         ),
                      //                       ),
                      //                     ),
                      //                     SizedBox(
                      //                       width: double.maxFinite,
                      //                       child: CardBorder(
                      //                           margin: EdgeInsets.zero,
                      //                           color: Colors.blue,
                      //                           onpress: () {
                      //                             String s = managectrl.allUsers
                      //                                     .firstWhereOrNull(
                      //                                       (element) =>
                      //                                           element.id ==
                      //                                           managectrl
                      //                                               .getsearchpayments[
                      //                                                   i]
                      //                                               .userId,
                      //                                     )
                      //                                     ?.fullName ??
                      //                                 "";
                      //                             createAndprintPdf(
                      //                               PaymentByTransaction(
                      //                                   fullName: s,
                      //                                   id: managectrl
                      //                                       .getsearchpayments[
                      //                                           i]
                      //                                       .id,
                      //                                   userId: managectrl
                      //                                       .getsearchpayments[
                      //                                           i]
                      //                                       .userId!,
                      //                                   amount: managectrl
                      //                                       .getsearchpayments[
                      //                                           i]
                      //                                       .amount!,
                      //                                   discountPercentage: managectrl
                      //                                       .getsearchpayments[
                      //                                           i]
                      //                                       .discountPercentage!
                      //                                       .toDouble(),
                      //                                   receivedAmount: managectrl
                      //                                       .getsearchpayments[
                      //                                           i]
                      //                                       .receivedAmount,
                      //                                   paymentDate: managectrl
                      //                                       .getsearchpayments[
                      //                                           i]
                      //                                       .paymentDate,
                      //                                   transactionId: managectrl
                      //                                       .getsearchpayments[
                      //                                           i]
                      //                                       .transactionId!,
                      //                                   paymentStatus: managectrl
                      //                                       .getsearchpayments[
                      //                                           i]
                      //                                       .paymentStatus!,
                      //                                   paymentMethod: managectrl
                      //                                       .getsearchpayments[
                      //                                           i]
                      //                                       .paymentMethod!,
                      //                                   paymentType: managectrl
                      //                                       .getsearchpayments[
                      //                                           i]
                      //                                       .paymentType!,
                      //                                   subscriptionId: managectrl
                      //                                       .getsearchpayments[
                      //                                           i]
                      //                                       .subscriptionId,
                      //                                   serviceUsageId: managectrl
                      //                                       .getsearchpayments[
                      //                                           i]
                      //                                       .serviceUsageId,
                      //                                   termsAndConditions:
                      //                                       true),
                                                        
                      //                               // name: managectrl.getallXtremer.firstWhere((element) => element.XtremerId == managectrl.getsearchpayments[i].userId ).firstName! + managectrl.getallXtremer.firstWhere((element) => element.XtremerId == managectrl.getsearchpayments[i].userId ).surname!
                      //                             );
                      //                           },
                      //                           child: const Center(
                      //                               child: Text(
                      //                             "Print Receipt",
                      //                             style:
                      //                                 TextStyle(fontSize: 16),
                      //                           ))),
                      //                     ),
                      //                   ],
                      //                 ),
                      //               ),
                      //             ),
                      //           ));
                      //         }),
                      //   ).animate().slideX(begin: 1, end: 0)),
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
          onTap: () {},
          onHover: (hovering) {
            setState(() {
              onhover = hovering;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: onhover
                  ? Colors.grey.withOpacity(0.1)
                  : Colors.transparent, // Subtle light grey on hover
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Receipt#"),
                          TitleText("${widget.payment.transactionId}",
                              size: 14, color: Colors.grey[700]),
                          const SizedBox(height: 10),
                          const Text("Payment Type"),
                          Text(
                            widget.payment.paymentType != null
                                ? widget.payment.paymentType!
                                : "",
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          const SizedBox(height: 6),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Redesigned Edit Button
                        IconButton(
                          onPressed: widget.edit,
                          icon: const Icon(Icons.edit,
                              size: 20, color: Colors.blueGrey),
                          tooltip: "Edit Payment",
                        ),
                        const SizedBox(height: 8),
                        // Redesigned View Button
                        ElevatedButton(
                          onPressed: widget.userss,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text("View",
                              style: TextStyle(color: Colors.white)),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${widget.payment.paymentDate.day}/${widget.payment.paymentDate.month}/${widget.payment.paymentDate.year}',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class PaymentGridSource extends DataGridSource{
  
  List<DataGridRow> _paymentRows = [];
  final ManagementController managectrl;
  final BuildContext context;
  PaymentGridSource(this.context, {required this.managectrl}){
    _paymentRows = managectrl.getsearchpayments.map<DataGridRow>((e) => DataGridRow(cells:[
      DataGridCell<String>(columnName: "Receipt", value:e.transactionId),
      DataGridCell<String>(columnName: "Name", value:managectrl.getUserbyId(e.userId??0)?.fullName??""),
      DataGridCell<String>(columnName: "Type", value:e.paymentType),
      DataGridCell<String>(columnName: "Method", value:e.paymentMethod),
      DataGridCell<DateTime>(columnName: "Date", value:e.paymentDate),
      DataGridCell<String>(columnName: "Status", value:e.paymentStatus),
      DataGridCell<Widget>(columnName: "Actions", value:  Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          CardwithShadow(
                       padding: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
            onpress: (){
              String paymentStatus = e.paymentStatus??"";
               Get.dialog(StatefulBuilder(
                 builder: (context,state) {
                   return Dialog(
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
                                                    HeadingText("Edit Payments",
                                                        size:
                                                            MediaQuery.sizeOf(context)
                                                                        .width <
                                                                    mobilescreen
                                                                ? 16
                                                                : null),
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
                                                                                    "${e.transactionId}"));
                                                                        CustomSnackbar(
                                                                          
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
                                                                  "${e.transactionId}"),
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
                                                                  "${e.paymentMethod}"),
                                                              const SizedBox(
                                                                height: 16,
                                                              ),
                                                              const Text(
                                                                "Amount",
                                                                style: TextStyle(
                                                                    fontSize: 14),
                                                              ),
                                                              Text(
                                                                "${e.receivedAmount}",
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
                                                                    state(() {
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
                                                                "${e.paymentDate.day}/${e.paymentDate.month}/${e.paymentDate.year}",
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
                                                            id:e
                                                                .id,
                                                            userId: e.userId,
                                                            amount: e.amount,
                                                            receivedAmount: e.receivedAmount,
                                                            paymentDate: e.paymentDate,
                                                            transactionId: e.transactionId,
                                                            paymentStatus: paymentStatus,
                                                             
                                                            paymentMethod:e.paymentMethod,
                                                            paymentType: e.paymentType,
                                                            discountPercentage:
                                                              e.discountPercentage,
                                                            serviceUsageId: e.serviceUsageId,
                                                            subscriptionId: e.subscriptionId);
                   
                                                        String s = await managectrl
                                                            .editpayments(payments);
                                                        // createAndPrintPdf(Paymententity(id: managectrl.getsearchpayments[i].id, userId: managectrl.getsearchpayments[i].userId!, amount: managectrl.getsearchpayments[i].amount!, discountPercentage: managectrl.getsearchpayments[i].discountPercentage!.toDouble(), receivedAmount: managectrl.getsearchpayments[i].receivedAmount, paymentDate: managectrl.getsearchpayments[i].paymentDate, transactionId:managectrl.getsearchpayments[i].transactionId!, paymentStatus: managectrl.getsearchpayments[i].paymentStatus!, paymentMethod:managectrl.getsearchpayments[i].paymentMethod!, paymentType: managectrl.getsearchpayments[i].paymentType!, subscriptionId: managectrl.getsearchpayments[i].subscriptionId, serviceUsageId: managectrl.getsearchpayments[i].serviceUsageId, termsAndConditions: true));
                                                        Get.back();
                                                        CustomSnackbar( s);
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
                                      );
                 }
               ));
            },
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.edit,size: 14,),
                SizedBox(width: 5,),
                Text("Edit",style: TextStyle(fontSize: 14)),
              ],
            )),
            const SizedBox(width: 6,),
            CardwithShadow(
             padding: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
              onpress: (){
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
                                                          color:e.paymentStatus!
                                                                      .toLowerCase() ==
                                                                  "success"
                                                              ? Colors.green[200]
                                                              : Colors.red[200],
                                                        ),
                                                        child:e.paymentStatus!
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
                                                        child: TitleText(e.paymentStatus!
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
                                                                          "${e.transactionId}"));
                                                              CustomSnackbar(
                                                           
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
                                                        "${e.transactionId}"),
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
                                                        "${e.paymentMethod}"),
                                                    const SizedBox(
                                                      height: 16,
                                                    ),
                                                    const Text(
                                                      "Amount",
                                                      style:
                                                          TextStyle(fontSize: 14),
                                                    ),
                                                    Text(
                                                      "${e.receivedAmount}",
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
                                                      "${e.paymentDate.day}/${e.paymentDate.month}/${e.paymentDate.year}",
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
                                                    String s = managectrl.allUsers
                                                            .firstWhereOrNull(
                                                              (element) =>
                                                                  element.id ==
                                                                  e.userId,
                                                            )
                                                            ?.fullName ??
                                                        "";
                                                    createAndprintPdf(
                                                      PaymentByTransaction(
                                                          fullName: s,
                                                          id:e.id,
                                                          userId: e.userId!,
                                                          amount: e.amount!,
                                                          discountPercentage:e.discountPercentage!
                                                              .toDouble(),
                                                          receivedAmount: e.receivedAmount,
                                                          paymentDate: e.paymentDate,
                                                          transactionId:e.transactionId!,
                                                          paymentStatus: e.paymentStatus!,
                                                          paymentMethod: e.paymentMethod!,
                                                          paymentType:e.paymentType!,
                                                          subscriptionId:e.subscriptionId,
                                                          serviceUsageId: e.serviceUsageId,
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
            },child: Text("View",style: TextStyle(fontSize: 14),))
        ],),
      ))
      ] ),).toList();
  }
  
   @override
  List<DataGridRow> get rows => _paymentRows;
  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
   return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((dataGridCell) {
        if (dataGridCell.columnName == 'Actions') {
          return dataGridCell.value as Widget; // Return action buttons
        }
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          alignment: Alignment.center,
          child: dataGridCell.columnName == 'Date'
              ? Text(
                  '${(dataGridCell.value as DateTime).day}/${(dataGridCell.value as DateTime).month}/${(dataGridCell.value as DateTime).year}',
                  style: const TextStyle(fontSize: 14),
                )
              : Text(
                  dataGridCell.value.toString(),
                  style: const TextStyle(fontSize: 14),
                ),
        );
      }).toList(),
    );
  }
  
}