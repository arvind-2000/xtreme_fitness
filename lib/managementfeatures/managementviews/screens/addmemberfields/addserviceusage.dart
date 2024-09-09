import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/landingpages/controllers/getxcontrol.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/servicesentity.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/addmemberscontrol.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/managementcontroller.dart';
import 'package:xtreme_fitness/widgets/card.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';
import 'package:xtreme_fitness/widgets/normaltext.dart';
import 'package:xtreme_fitness/widgets/textformwidget.dart';

import '../../../../config/const.dart';
import '../../../../widgets/cardborder.dart';
import '../../../../widgets/cardswithshadow.dart';
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
    return GetBuilder<AddMemberController>(builder: (addmemberctrl) {
      return GetBuilder<GetxLandingcontroller>(builder: (landingctrl) {
        return ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000, maxHeight: 1000),
          child: addmemberctrl.paymentstatus != 0
              ? const PaymentStatusCard()
              : Form(
                  key: _globalKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const HeadingText("Book Service"),
                        const SizedBox(
                          height: 16,
                        ),
                        landingctrl.getallplans.isEmpty
                            ? const NodataScreen(
                                title: "No Services",
                                desc: "No Services to show.",
                                onpress: null,
                              )
                            : GridView(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: size < 500
                                      ? 1
                                      : size < mobilescreen
                                          ? 2
                                          : size > mobilescreen && size < 1200
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
                                    .asMap()
                                    .entries
                                    .map(
                                      (e) => CardwithShadow(
                                          // margin: const EdgeInsets.all(16),
                                          color:
                                              addmemberctrl.selectedservice !=
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
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text("Member Price"),
                                                    Text(
                                                      e.value.memberPrice
                                                          .toString(),
                                                      style: const TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    const Text(
                                                        "Non Member Price"),
                                                    Text(
                                                      e.value.memberPrice
                                                          .toString(),
                                                      style: const TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold),
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
                                                        .addservices(e.value);
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
                                                                    e.value.id
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
                                                          : const Text(
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
                        const SizedBox(
                          height: 16,
                        ),
                        Center(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 700),
                            child: Column(
                              children: [
                                const NormalText(
                                  text: "Bill Details",
                                  size: 16,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Amount"),
                                    Text(
                                        "Rs . ${addmemberctrl.selectedservice!.nonMemberPrice}")
                                  ],
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Divider(
                                  color: Colors.grey[600],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Total Amount"),
                                    Text(
                                        "Rs . ${addmemberctrl.selectedservice!.nonMemberPrice}")
                                  ],
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Cardonly(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    padding: const EdgeInsets.all(16),
                                    margin: EdgeInsets.zero,
                                    onpress: () async {
                                      // create user
                                      bool v = await addmemberctrl.createuser(
                                          widget.phonenumber,
                                          widget.phonenumber,
                                          widget.phonenumber);
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
                                      //
                                    },
                                    child: const Row(
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
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        );
      });
    });
  }
}
