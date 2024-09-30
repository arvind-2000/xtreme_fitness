import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/serviceusage.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/managementcontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/pagecontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/nodatascreen.dart/nodatascreen.dart';

import 'package:xtreme_fitness/widgets/titletext.dart';

import '../../../config/const.dart';

import '../../../widgets/cardborder.dart';
import '../../../widgets/headingtext.dart';
import '../../../widgets/textformwidget.dart';

import '../widgets/scaffolds.dart';

class ServiceUsageScreen extends StatefulWidget {
  const ServiceUsageScreen({super.key});

  @override
  State<ServiceUsageScreen> createState() => _ServiceUsageScreenState();
}

class _ServiceUsageScreenState extends State<ServiceUsageScreen> {
  String? serviceStatus;
  List<String> serviceActive = ["Success", "Failed", "Cancel", "Initiated"];
  List<String> d = ["InActive","Active"];
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
  int paymentallpos = 0;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetxPageController>(builder: (pagectrl) {
      return GetBuilder<ManagementController>(builder: (managectrl) {
        return managectrl.getallpayments.isEmpty
            ? const NodataScreen(title: "ServiceUsage", desc: "No Service Usage Records")
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
                            const HeadingText("Service Usage"),
                             SizedBox(
                                        height:MediaQuery.sizeOf(context).width<=mobilescreen?40 :50,
                                     
                                        child: CardBorder(
                                          onpress: () {
                                          
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
                                                child: Image.asset('assets/file.png',)),
                                              Text("Export"),
                                            ],
                                          )
                                        )),
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
                                  hint: "Search services",
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
                  managectrl.getallServicesSchedule.isEmpty
                      ? const NodataScreen(
                          title: "Service Usage", desc: "No service records")
                      : Expanded(
                          child: ListView.builder(
                            itemCount: managectrl.getallServicesSchedule.length,
                            itemBuilder: (c, i) => ListCard2(
                              servicename: '${managectrl.getallservices.firstWhereOrNull((element) => element.id ==managectrl.getallServicesSchedule[i].serviceId,)?.name}',
                              name:   "${managectrl.getallXtremer.firstWhereOrNull((element) => element.XtremerId==managectrl.getallServicesSchedule[i].userId,)?.firstName} ${managectrl.getallXtremer.firstWhereOrNull((element) => element.XtremerId==managectrl.getallServicesSchedule[i].userId,)?.surname}",
                                service: managectrl.getallServicesSchedule[i],
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
                                                    "Edit Service"),
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
                                                                "Name",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        14),
                                                              ),
                                                      
                                                            ],
                                                          ),
                                                          Text(
                                                              "${managectrl.getallXtremer.firstWhereOrNull((element) => element.XtremerId==managectrl.getallServicesSchedule[i].userId,)?.firstName} ${managectrl.getallXtremer.firstWhereOrNull((element) => element.XtremerId==managectrl.getallServicesSchedule[i].userId,)?.surname}"),
                                                          const SizedBox(
                                                            height: 16,
                                                          ),
                                                             const Text(
                                                            "Service:",
                                                            style: TextStyle(
                                                                fontSize: 14),
                                                          ),
                                                            
                                                          Text(
                                                             '${managectrl.getallservices.firstWhereOrNull((element) => element.id ==managectrl.getallServicesSchedule[i].serviceId,)?.name}'),
                                                          const SizedBox(
                                                            height: 16,
                                                          ),
                                                          const Text(
                                                            "Date",
                                                            style: TextStyle(
                                                                fontSize: 14),
                                                          ),
                                                          Text(
                                                              "${managectrl.getallServicesSchedule[i].scheduleDate.day}/${managectrl.getallServicesSchedule[i].scheduleDate.month}/${managectrl.getallServicesSchedule[i].scheduleDate.year}"),
                                                          const SizedBox(
                                                            height: 16,
                                                          ),
                                                          const Text(
                                                            "Amount",
                                                            style: TextStyle(
                                                                fontSize: 14),
                                                          ),
                                                          Text(
                                                            "${managectrl.getallServicesSchedule[i].serviceId}",
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
                                                                  serviceStatus = d[index!];
                                                              });
                                                              },

                                                              hintText:
                                                                 managectrl.getallServicesSchedule[i].status,
                                                              dropdownMenuEntries: 
                                                                  d.asMap()
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
                                                    ServiceSchedule d = managectrl.getallServicesSchedule[i];
                                                    d.status = serviceStatus??d.status;
                                                    String v = await managectrl.updateserviceschedule(d);
                                                    // createAndPrintPdf(Paymententity(id: managectrl.getallServicesSchedule[i].id, userId: managectrl.getallServicesSchedule[i].userId!, amount: managectrl.getallServicesSchedule[i].amount!, discountPercentage: managectrl.getallServicesSchedule[i].discountPercentage!.toDouble(), receivedAmount: managectrl.getallServicesSchedule[i].receivedAmount, paymentDate: managectrl.getallServicesSchedule[i].paymentDate, transactionId:managectrl.getallServicesSchedule[i].transactionId!, paymentStatus: managectrl.getallServicesSchedule[i].paymentStatus!, paymentMethod:managectrl.getallServicesSchedule[i].paymentMethod!, paymentType: managectrl.getallServicesSchedule[i].paymentType!, subscriptionId: managectrl.getallServicesSchedule[i].subscriptionId, serviceUsageId: managectrl.getallServicesSchedule[i].serviceUsageId, termsAndConditions: true));
                                                    Navigator.pop(context);
                                                    CustomSnackbar(
                                                        context, v);
                                                  },
                                                  child: const Center(
                                                      child: Text(
                                                    "Edit Service",
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

class ListCard2 extends StatefulWidget {
  const ListCard2({
    super.key,
    required this.service,
    required this.userss,
    this.edit, required this.name, required this.servicename,
  });

  final ServiceSchedule service;
  final VoidCallback userss;
  final VoidCallback? edit;
  final String name;
  final String servicename;
  @override
  State<ListCard2> createState() => _ListCardState();
}

class _ListCardState extends State<ListCard2> {
  bool onhover = false;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetxPageController>(builder: (pagectrl) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal:16),
        child: InkWell(
          mouseCursor: MouseCursor.uncontrolled,
          onTap: (){},
          onHover: (v){
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
                            TitleText(
                              "Name: ${widget.name}",
                              size: 16,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                         
                           
                                 TitleText(
                              "Service Name: ${widget.servicename}",
                              size: 16,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("status"),
                            Text(
                                widget.service.status,
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
                              onPressed: widget.edit,
                              icon: const Icon(
                                Icons.edit,
                                size: 14,
                              )),
                          // CardBorder(
                          //     padding: const EdgeInsets.symmetric(
                          //         vertical: 8, horizontal: 32),
                          //     margin: EdgeInsets.zero,
                          //     onpress: widget.userss,
                          //     color: Colors.blue,
                          //     child: const Text("View")),
                          const SizedBox(
                            height: 16,
                          ),
                                        
                  
                        ],
                      )
                    ],
                  ),
                ),
                    Divider(color: Colors.white.withOpacity(0.4),)    
              ],
            ),
          ),
        
      );
    });
  }
}
