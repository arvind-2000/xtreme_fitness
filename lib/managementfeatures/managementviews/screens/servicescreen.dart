import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/controller/authcontroller.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/addmemberscontrol.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/addmemberfields/addserviceusage.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/addservicesfields/addservicefield.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/nodatascreen.dart/nodatascreen.dart';
import 'package:xtreme_fitness/widgets/card.dart';

import '../../../widgets/cardborder.dart';
import '../../../widgets/cardswithshadow.dart';
import '../../../widgets/headingtext.dart';
import '../../../widgets/normaltext.dart';
import '../controllers/managementcontroller.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  bool _isserviceadd = false;
  bool isactive = true;

  void isaddservice() {
    setState(() {
      _isserviceadd = !_isserviceadd;
    });
  }

  void changeIsActive() {
    setState(() {
      isactive = !isactive;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Get.find<AddMemberController>().changepaymentstatus(0);
      },
    );
  }

  @override
  void dispose() {
    Get.find<AddMemberController>().removeServiceusage();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.sizeOf(context).width;
    return GetBuilder<AddMemberController>(builder: (addmemberctrl) {
      return GetBuilder<GetxAuthController>(builder: (authcrl) {
        return GetBuilder<ManagementController>(
            builder: (managementcontroller) {
          return addmemberctrl.serviceusagepage
              ? const AddServiceUsage()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const HeadingText(
                            "Service",
                            size: 30,
                          ),
                          authcrl.ismember
                              ? const SizedBox()
                              : CardBorder(
                                  onpress: () {
                                    Get.dialog(
                                        barrierDismissible: false,
                                        Dialog(
                                          child: SizedBox(
                                            height: 600,
                                            width: 500,
                                            child: AddServiceField(onpress: () {
                                              Navigator.pop(context);
                                            }),
                                          ),
                                        ));
                                  },
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 16),
                                  child: const Row(
                                    children: [
                                      Icon(
                                        Icons.add,
                                        size: 12,
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Text("Add Service")
                                    ],
                                  ))
                        ],
                      ),
                    ),
                    managementcontroller.ismember ||
                            managementcontroller.getallservices.isEmpty
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
                    managementcontroller.getallservices.isEmpty
                        ? const Expanded(
                            child: NodataScreen(
                                title: "Services",
                                desc: " No Services to show"))
                        : Expanded(
                            child: GridView(
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: size < 500
                                      ? 1
                                      : size < mobilescreen
                                          ? 2
                                          : size >= mobilescreen && size < 1200
                                              ? 3
                                              : 4,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: size < 500
                                      ? 1
                                      : size >= mobilescreen && size < 1300
                                          ? 3 / 4.4
                                          : size < mobilescreen
                                              ? 3 / 4
                                              : 3 / 3.5,
                                ),
                                children: managementcontroller.getallservices
                                    .asMap()
                                    .entries
                                    .where(
                                      (element) =>
                                          element.value.isactive == isactive,
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
                                                  Expanded(
                                                    child: HeadingText(
                                                      e.value.name,
                                                      size: 24,
                                                    ),
                                                  ),
                                                  authcrl.ismember
                                                      ? const SizedBox()
                                                      : Row(
                                                          children: [
                                                            IconButton(
                                                                onPressed: () {
                                                                  Get.dialog(
                                                                      Dialog(
                                                                    child:
                                                                        SizedBox(
                                                                      height:
                                                                          600,
                                                                      width:
                                                                          500,
                                                                      child:
                                                                          AddServiceField(
                                                                        onpress:
                                                                            () =>
                                                                                Navigator.pop(context),
                                                                        service:
                                                                            e.value,
                                                                        edit:
                                                                            true,
                                                                      ),
                                                                    ),
                                                                  ));
                                                                  // managementcontroller.deletservices(e.value);
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
                                                      "${e.value.nonMemberPrice}",
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
                                              e.value.isactive
                                                  ? CardBorder(
                                                      onpress: () {
                                                        addmemberctrl
                                                            .addservices(
                                                                e.value);
                                                        addmemberctrl
                                                            .changeServiceUsage(
                                                                ispage: true);
                                                      },
                                                      color: Colors.green[300],
                                                      child: const Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                            Icons.add,
                                                            color: Colors.white,
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            "CheckOut",
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
  }
}
