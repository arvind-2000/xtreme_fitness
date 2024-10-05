import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/controller/authcontroller.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/addmemberscontrol.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/managementcontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/pagecontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/addplanfields/addplanscreen.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/editrenewxtremers/renewalforms.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/nodatascreen.dart/nodatascreen.dart';
import 'package:xtreme_fitness/widgets/cardborder.dart';

import '../../../widgets/card.dart';
import '../../../widgets/cardswithshadow.dart';
import '../../../widgets/headingtext.dart';
import '../../../widgets/normaltext.dart';

class PlansScreen extends StatefulWidget {
  const PlansScreen({super.key});

  @override
  State<PlansScreen> createState() => _PlansScreenState();
}

class _PlansScreenState extends State<PlansScreen> {
  // bool _isplanadd = false;
  bool isactive = true;
  // void isaddplan() {
  //   setState(() {
  //     _isplanadd = !_isplanadd;
  //   });
  // }
  void changeIsActive() {
    setState(() {
      isactive = !isactive;
    });
  }

  @override
  Widget build(BuildContext context) {
    GetxPageController pagecotrl = Get.put(GetxPageController());
    AddMemberController addmemberctrl = Get.put(AddMemberController());
    ManagementController managementcontroller = Get.put(ManagementController());
    final double size = MediaQuery.sizeOf(context).width;
    return GetBuilder<GetxAuthController>(builder: (authctrl) {
      return GetBuilder<AddMemberController>(builder: (_) {
        return GetBuilder<GetxPageController>(builder: (_) {
          return GetBuilder<ManagementController>(builder: (_) {
            return authctrl.ismember!=null && authctrl.ismember! && pagecotrl.isrenewalforms
                ? RenewalForms(
                    callback: () {
                      pagecotrl.changerenewal(false);
                    },
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const HeadingText(
                              "Plans",
                              size: 30,
                            ),
                           authctrl.ismember!=null && authctrl.ismember!
                                ? const SizedBox()
                                : CardBorder(
                                    onpress: () {
                                      Get.dialog(Dialog(
                                        backgroundColor: Colors.grey[800],
                                        insetPadding: const EdgeInsets.all(16),
                                        child: ConstrainedBox(
                                          constraints: const BoxConstraints(
                                              maxWidth: 500),
                                          // height: 600,
                                          // width: 500,
                                          child: AddPlanFields(onpress: () {
                                            Navigator.pop(context);
                                          }),
                                        ),
                                      ));
                                    },
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 16),
                                    child: const Row(
                                      children: [
                                        Icon(Icons.add),
                                        Text("Add Plan")
                                      ],
                                    ))
                          ],
                        ),
                      ),
                      authctrl.ismember ||
                              managementcontroller.getallplans.isEmpty
                          ? const SizedBox()
                          : Row(
                              children: [
                                Cardonly(
                                    onpress: changeIsActive,
                                    child: NormalText(
                                      text: "Active",
                                      color: isactive
                                          ? Theme.of(context)
                                              .colorScheme
                                              .secondary
                                          : null,
                                    )),
                                const SizedBox(
                                  width: 5,
                                ),
                                Cardonly(
                                    onpress: changeIsActive,
                                    child: NormalText(
                                      text: "Disable",
                                      color: !isactive
                                          ? Theme.of(context)
                                              .colorScheme
                                              .secondary
                                          : null,
                                    )),
                              ],
                            ),
                      managementcontroller.getallplans.isEmpty
                          ? const Expanded(
                              child: NodataScreen(
                                title: "No Plans",
                                desc: "No plans to show",
                                // onpress: isaddplan,
                              ),
                            )
                          : Expanded(
                              child: GridView(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: size < 500
                                        ? 1
                                        : size < mobilescreen
                                            ? 2
                                            : size >= mobilescreen &&
                                                    size < 1200
                                                ? 3
                                                : 4,
                                    mainAxisSpacing: 10,
                                    childAspectRatio: size < 500
                                        ? 1
                                        : size >= mobilescreen && size < 1350
                                            ? 3 / 4.9
                                            : size < mobilescreen
                                                ? 3 / 4.4
                                                : 3 / 3.8,
                                  ),
                                  shrinkWrap: true,
                                  children: managementcontroller.getallplans
                                      .asMap()
                                      .entries
                                      .where(
                                        (element) =>
                                            element.value.isActive == isactive,
                                      )
                                      .map(
                                        (e) => CardwithShadow(
                                            margin: const EdgeInsets.all(16),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    HeadingText(
                                                      e.value.category,
                                                      size: 24,
                                                    ),
                                       authctrl.ismember
                                                        ? const SizedBox()
                                                        : Row(
                                                            children: [
                                                              IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    Get.dialog(
                                                                        Dialog(
                                                                      child:
                                                                          SizedBox(
                                                                        height:
                                                                            600,
                                                                        width:
                                                                            500,
                                                                        child:
                                                                            AddPlanFields(
                                                                          onpress: () =>
                                                                              Navigator.pop(context),
                                                                          plan:
                                                                              e.value,
                                                                          edit:
                                                                              true,
                                                                        ),
                                                                      ),
                                                                    ));
                                                                  },
                                                                  icon:
                                                                      const Icon(
                                                                    Icons.edit,
                                                                    size: 12,
                                                                  )),
                                                              const SizedBox(
                                                                width: 10,
                                                              ),
                                                            ],
                                                          )
                                                  ],
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
                                                       Text("Price",style: TextStyle(color: Colors.grey[500]),),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            e.value.price
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(
                                                            "/${e.value.durationInMonths} ${e.value.durationInMonths <= 1 ? "month" : "months"}",
                                                            style:TextStyle(
                                                                fontSize: 12,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,color: Colors.grey[500]),
                                                          )
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                  Text("Discount",style: TextStyle(color: Colors.grey[500]),),
                                                      Text(
                                                        "${e.value.discountPercentage}%",
                                                        style:  TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold,),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      const Text(
                                                          "Actual Price"),
                                                      HeadingText(
                                                        "${e.value.price - (e.value.price * (e.value.discountPercentage / 100))}",
                                                        size: 24,
                                                        
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                e.value.isActive!
                                                    ? CardBorder(
                                                        onpress: () {
                                                          if (authctrl.ismember!=null && authctrl.ismember!) {
                                                            //print(   "change plan screen to renewal");
                                                            pagecotrl
                                                                .changerenewal(
                                                                    true);
                                                          } else {
                                                            pagecotrl
                                                                .changeNavPage(
                                                                    2);
                                                          }

                                                          addmemberctrl
                                                              .addplan(e.value);
                                                        },
                                                        color:
                                                            Colors.green[300],
                                                        child: const Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              Icons.add,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                              "Checkout",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            )
                                                          ],
                                                        ))
                                                    : const SizedBox()
                                              ],
                                            )),
                                      )
                                      .toList()),
                            ),
                      const SizedBox(
                        height: 40,
                      )
                    ],
                  );
          });
        });
      });
    });
  }
}
