import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/pages/dialogs/logindialog.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/landingpages/controllers/getxcontrol.dart';
import 'package:xtreme_fitness/landingpages/pages/responsivepages.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/addmemberscontrol.dart';
import 'package:xtreme_fitness/widgets/card.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';

import '../../../widgets/cardborder.dart';

class Pricesdesktop extends StatefulWidget {
  const Pricesdesktop({
    super.key,
  });

  @override
  State<Pricesdesktop> createState() => _PricesdesktopState();
}

class _PricesdesktopState extends State<Pricesdesktop> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AddMemberController addmemberctrl = Get.put(AddMemberController());
    GetxLandingcontroller managectrl = Get.put(GetxLandingcontroller());
    return GetBuilder<AddMemberController>(builder: (_) {
      return GetBuilder<GetxLandingcontroller>(builder: (_) {
        return SingleChildScrollView(
          child: ResponsivePages(
            issize: false,
            colors: const Color.fromARGB(255, 15, 15, 15),
            child1: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const HeadingText(
                    "Choose The Best Plan",
                    size: 40,
                    isbold: true,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Choose a plan that's right for you. Flexible, Simple & no hidden prices",
                    style: TextStyle(color: Colors.white60),
                  ),
                  const SizedBox(
                    height: 40,
                  ),

                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: CardBorder(
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.zero,
                      child: Row(
                      mainAxisAlignment:MediaQuery.sizeOf(context).width<=mobilescreen?MainAxisAlignment.spaceBetween: MainAxisAlignment.center,
                      mainAxisSize:MediaQuery.sizeOf(context).width<=mobilescreen?MainAxisSize.max : MainAxisSize.min,
                        children:[
                          Cardonly(
                            margin: EdgeInsets.zero,
                            padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                            onpress: (){
                                managectrl.changeplanduration(1);
                            },
                                          color: managectrl.plandurations == 1
                                    ? Theme.of(context).colorScheme.secondary
                                    :Colors.transparent,
                            child: Text("1 ${MediaQuery.sizeOf(context).width<=mobilescreen?"M": "month"}")),
                                  Cardonly(
                                        margin: EdgeInsets.zero,
                                           padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                            onpress: (){
                                 managectrl.changeplanduration(3);
                            },
                                          color: managectrl.plandurations == 3
                                    ? Theme.of(context).colorScheme.secondary
                                    : Colors.transparent,
                            child: Text("3 ${MediaQuery.sizeOf(context).width<=mobilescreen?"M": "months"}")),
                                  Cardonly(
                                        margin: EdgeInsets.zero,
                                           padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                            onpress: (){
                                managectrl.changeplanduration(6);
                            },
                                          color: managectrl.plandurations == 6
                                    ? Theme.of(context).colorScheme.secondary
                                    : Colors.transparent,
                            child: Text("6 ${MediaQuery.sizeOf(context).width<=mobilescreen?"M": "months"}")),
                                  Cardonly(
                                        margin: EdgeInsets.zero,
                                           padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                            onpress: (){
                                managectrl.changeplanduration(12);
                            },
                                          color: managectrl.plandurations == 12
                                    ? Theme.of(context).colorScheme.secondary
                                    : Colors.transparent,
                            child: Text("12 ${MediaQuery.sizeOf(context).width<=mobilescreen?"M": "months"}")),
                        ]
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    height:MediaQuery.sizeOf(context).width<=mobilescreen?null:470,
                    child: Center(
                      child: ListView(
                        shrinkWrap: true,
                        physics:MediaQuery.sizeOf(context).width<=mobilescreen? const NeverScrollableScrollPhysics():const BouncingScrollPhysics(),
                        // controller: PageController(viewportFraction: 0.3,initialPage: 1),
                        scrollDirection:MediaQuery.sizeOf(context).width<=mobilescreen?Axis.vertical:Axis.horizontal,
                        children: managectrl.getallplans
                            .where(
                              (element) {
                                return element.durationInMonths ==
                                    managectrl.plandurations;
                              },
                            )
                            .toList()
                            .asMap()
                            .entries
                            .map(
                              (e) => Padding(
                                padding:
                                 MediaQuery.sizeOf(context).width<=mobilescreen?EdgeInsets.zero:const EdgeInsets.only(left: 100, right: 16),
                                child: SizedBox(
                                  width: MediaQuery.sizeOf(context).width<=mobilescreen?double.maxFinite:400,
                                  child: CardwithShadow(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 32, horizontal: 0),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 32, horizontal: 32),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          HeadingText(
                                            e.value.category,
                                            size: 20,
                                            color: Colors.white60,
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    "Rs ${e.value.price - (e.value.price * (e.value.discountPercentage / 100))}",
                                                    style: const TextStyle(
                                                        fontSize: 26,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                      "/${e.value.durationInMonths} ${e.value.durationInMonths <= 1 ? "month" : "months"}")
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              e.value.discountPercentage <= 0
                                                  ? const SizedBox()
                                                  : const Text(
                                                      "Discount",
                                                      style: TextStyle(
                                                        color: Colors.white60,
                                                      ),
                                                    ),
                                              e.value.discountPercentage <= 0
                                                  ? const SizedBox()
                                                  : Text(
                                                      "${e.value.discountPercentage}%",
                                                      style: const TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                              const SizedBox(
                                                height: 30,
                                              ),
                                              const Text(
                                                "Features",
                                                style: TextStyle(
                                                  color: Colors.white60,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 16,
                                              ),
                                              Row(
                                                children: [
                                                  e.value.category
                                                              .toLowerCase() ==
                                                          "personal"
                                                      ? const Icon(
                                                          Icons.check,
                                                          color: Colors.green,
                                                          size: 14,
                                                        )
                                                      : const Icon(
                                                          Icons.close,
                                                          color: Colors.red,
                                                          size: 14,
                                                        ),
                                                  const SizedBox(
                                                    width: 16,
                                                  ),
                                                  e.value.category
                                                              .toLowerCase() ==
                                                          "personal"
                                                      ? Text(
                                                          "Trainer Included",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .onSurface
                                                                  .withOpacity(
                                                                      0.7)),
                                                        )
                                                      : Text(
                                                          "No Trainers",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .onSurface
                                                                  .withOpacity(
                                                                      0.7)),
                                                        ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  const Icon(Icons.check,
                                                      color: Colors.green,
                                                      size: 14),
                                                  const SizedBox(
                                                    width: 16,
                                                  ),
                                                  Text(
                                                    "Service Discount",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .onSurface
                                                            .withOpacity(0.7)),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.check,
                                                    color: Colors.green,
                                                    size: 14,
                                                  ),
                                                  const SizedBox(
                                                    width: 16,
                                                  ),
                                                  Text(
                                                    "One time BMI Free",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .onSurface
                                                            .withOpacity(0.7)),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: double.maxFinite,
                                            child: Cardonly(
                                                onpress: () {
                                                  addmemberctrl
                                                      .addplan(e.value);
                                                  Get.dialog(
                                                    barrierDismissible: false,
                                                    const LoginDialog(
                                                      signupdialog: true,
                                                    ),
                                                  );
                                                },
                                                margin: EdgeInsets.zero,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary,
                                                child: const Center(
                                                    child: Text(
                                                  "Choose Plan",
                                                  style: TextStyle(),
                                                ))),
                                          )
                                        ],
                                      )),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50,)
                ],
              ),
            ),
          ),
        );
      });
    });
  }
}
