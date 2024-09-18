import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/controller/authcontroller.dart';
import 'package:xtreme_fitness/landingpages/controllers/getxcontrol.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/servicesentity.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/addmemberscontrol.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/widgets/dialogswidget.dart';
import 'package:xtreme_fitness/widgets/card.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';
import 'package:xtreme_fitness/widgets/normaltext.dart';

import '../../../../config/const.dart';
import '../../../../widgets/cardborder.dart';
import '../../../../widgets/cardswithshadow.dart';
import '../../../../widgets/titletext.dart';
import '../../widgets/paymentstatuscard.dart';
import '../nodatascreen.dart/nodatascreen.dart';

class AddServiceUsage extends StatefulWidget {
  const AddServiceUsage({super.key, this.serviceEntity, this.phonenumber});
  final ServiceEntity? serviceEntity;
  final String? phonenumber;
  @override
  State<AddServiceUsage> createState() => _AddServiceUsageState();
}

class _AddServiceUsageState extends State<AddServiceUsage> {
  final GlobalKey<FormState> _globalKey = GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.serviceEntity != null) {
        Get.put(AddMemberController()).addservices(widget.serviceEntity!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context).width;
    return GetBuilder<GetxAuthController>(builder: (authctrl) {
      return GetBuilder<AddMemberController>(builder: (addmemberctrl) {
        return GetBuilder<GetxLandingcontroller>(builder: (landingctrl) {
          return Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 1000, maxHeight: 1000),
              child: addmemberctrl.paymentstatus != 0
                  ? PaymentStatusCard(
                      callback: () {
                        addmemberctrl.changepaymentstatus(0);
                      },
                    )
                  : Form(
                      key: _globalKey,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HeadingText("Book Service"),
                            const SizedBox(
                              height: 16,
                            ),
                            landingctrl.getallservices.isEmpty
                                ? const NodataScreen(
                                    title: "No Services",
                                    desc: "No Services to show.",
                                    onpress: null,
                                  )
                                : GridView(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: size < 500
                                          ? 1
                                          : size < mobilescreen
                                              ? 2
                                              : size > mobilescreen &&
                                                      size < 1200
                                                  ? 3
                                                  : 3,
                                      mainAxisSpacing: 16,
                                      crossAxisSpacing: 16,
                                      childAspectRatio: size < 500
                                          ? 1
                                          : size < 700
                                              ? 4 / 6
                                              : 4 / 5,
                                    ),
                                    children: landingctrl.getallservices
                                        .where(
                                          (element) => element.isactive,
                                        )
                                        .toList()
                                        .asMap()
                                        .entries
                                        .map(
                                          (e) => CardwithShadow(
                                              // margin: const EdgeInsets.all(16),
                                              color: addmemberctrl
                                                          .selectedservice !=
                                                      null
                                                  ? addmemberctrl
                                                              .selectedservice!
                                                              .id ==
                                                          e.value.id
                                                      ? Colors.grey[700]
                                                      : null
                                                  : null,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  HeadingText(
                                                    e.value.name,
                                                    size: 24,
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Text(
                                                            "Member Price"),
                                                        Text(
                                                          e.value.memberPrice
                                                              .toString(),
                                                          style: const TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        const Text(
                                                            "Non Member Price"),
                                                        Text(
                                                          e.value.nonMemberPrice
                                                              .toString(),
                                                          style: const TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  CardBorder(
                                                      onpress: () {
                                                        addmemberctrl
                                                            .addservices(
                                                                e.value);
                                                      },
                                                      color: Colors.green[300],
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                            addmemberctrl.selectedservice !=
                                                                        null &&
                                                                    addmemberctrl
                                                                            .selectedservice!
                                                                            .id ==
                                                                        e.value
                                                                            .id
                                                                ? Icons.check
                                                                : Icons.add,
                                                            color: Colors.white,
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          addmemberctrl.selectedservice !=
                                                                      null &&
                                                                  addmemberctrl
                                                                          .selectedservice!
                                                                          .id ==
                                                                      e.value.id
                                                              ? const Text(
                                                                  "Service Added",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white))
                                                              : Text(
                                                                  "Add Service",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                )
                                                        ],
                                                      ))
                                                ],
                                              )),
                                        )
                                        .toList()),
                            SizedBox(
                              height: 16,
                            ),
                            addmemberctrl.selectedservice == null
                                ? SizedBox()
                                : Column(
                                    children: [
                                      NormalText(
                                        text: "Bill Details",
                                        size: 16,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Amount"),
                                          Text(
                                              "Rs . ${addmemberctrl.selectedservice!.nonMemberPrice}")
                                        ],
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      Divider(
                                        color: Colors.grey[600],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Total Amount"),
                                          Text(
                                              "Rs . ${addmemberctrl.selectedservice!.nonMemberPrice}")
                                        ],
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      Cardonly(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          padding: EdgeInsets.all(16),
                                          margin: EdgeInsets.zero,
                                          onpress: () async {
                                            Get.dialog(PageDialog(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      const TitleText(
                                                          "Payment Method"),
                                                      IconButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          icon: const Icon(
                                                              Icons.close))
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 30,
                                                  ),
                                                  NormalText(
                                                    text: "Bill Details",
                                                    size: 16,
                                                  ),
   Text(
                                                          addmemberctrl.selectedservice!.name),
                                                
                                                  SizedBox(
                                                    height: 16,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text("Amount"),
                                                      Text(
                                                          "Rs . ${addmemberctrl.selectedservice!.nonMemberPrice}")
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 16,
                                                  ),
                                                  Divider(
                                                    color: Colors.grey[600],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text("Total Amount"),
                                                      Text(
                                                          "Rs . ${addmemberctrl.selectedservice!.nonMemberPrice}")
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              no: () {Navigator.pop(context);},
                                              yes: () async {
                                                bool v = true;
                                                // create user
                                                if (authctrl.userid == null) {
                                                  v = await addmemberctrl
                                                      .createuser(
                                                    widget.phonenumber,
                                                    widget.phonenumber,
                                                    widget.phonenumber,
                                                  );
                                                }

                                                // payments
                                                print(
                                                    "In service id : ${addmemberctrl.selectedservice!.id}");
                                                if (v) {
                                                  addmemberctrl.addServiceusage(
                                                      paymentonline: false);
                                                } else {
                                                  print(
                                                      "${addmemberctrl.usererrormessage}");
                                                }
                                              },
                                            ));
                                            // Navigator.pop(context);
                                            //
                                          },
                                          child: Row(
                                            children: [
                                              Icon(Icons.add),
                                              SizedBox(
                                                width: 6,
                                              ),
                                              Text("Add Service"),
                                            ],
                                          )),
                                    ],
                                  ),
                          ],
                        ),
                      ),
                    ),
            ),
          );
        });
      });
    });
  }
}
