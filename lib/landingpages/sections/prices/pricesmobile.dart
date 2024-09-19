import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/landingpages/controllers/getxcontrol.dart';
import 'package:xtreme_fitness/landingpages/pages/responsivepages.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/addmemberscontrol.dart';
import 'package:xtreme_fitness/widgets/card.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';

class Pricesmobile extends StatefulWidget {
  const Pricesmobile({
    super.key,
  });

  @override
  State<Pricesmobile> createState() => _PricesmobileState();
}

class _PricesmobileState extends State<Pricesmobile> {
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
            colors: const Color.fromARGB(255, 15, 15, 15),
            child1: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  const HeadingText(
                    "Choose The Best Plan",
                    size: 30,
                    isbold: true,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      "Choose a plan that's right for you. Flexible, Simple & no hidden prices",
                      style: TextStyle(color: Colors.white60),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                          onTap: () {
                            managectrl.changeplanduration(1);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.red),
                              borderRadius: BorderRadius.circular(10),
                              color: managectrl.plandurations == 1
                                  ? Theme.of(context).colorScheme.secondary
                                  : null,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "1 Month",
                                style: TextStyle(
                                    // color: managectrl.plandurations == 1
                                    //     ? Theme.of(context).colorScheme.secondary
                                    //     : null,
                                    fontSize: managectrl.plandurations == 1
                                        ? 16
                                        : 14),
                              ),
                            ),
                          )),
                      const SizedBox(
                        width: 20,
                      ),
                      InkWell(
                          onTap: () {
                            managectrl.changeplanduration(3);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.red),
                              borderRadius: BorderRadius.circular(10),
                              color: managectrl.plandurations == 3
                                  ? Theme.of(context).colorScheme.secondary
                                  : null,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "3 Months",
                                style: TextStyle(
                                    fontSize: managectrl.plandurations == 3
                                        ? 16
                                        : 14),
                              ),
                            ),
                          )),
                      const SizedBox(
                        width: 20,
                      ),
                      InkWell(
                          onTap: () {
                            managectrl.changeplanduration(6);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.red),
                              borderRadius: BorderRadius.circular(10),
                              color: managectrl.plandurations == 6
                                  ? Theme.of(context).colorScheme.secondary
                                  : null,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "6 Months",
                                style: TextStyle(
                                    fontSize: managectrl.plandurations == 6
                                        ? 16
                                        : 14),
                              ),
                            ),
                          )),
                      const SizedBox(
                        width: 20,
                      ),
                      InkWell(
                          onTap: () {
                            managectrl.changeplanduration(12);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.red),
                              borderRadius: BorderRadius.circular(10),
                              color: managectrl.plandurations == 12
                                  ? Theme.of(context).colorScheme.secondary
                                  : null,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "12 Months",
                                style: TextStyle(
                                    fontSize: managectrl.plandurations == 12
                                        ? 16
                                        : 14),
                              ),
                            ),
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    child: Center(
                      child: GridView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Number of items in a row
                          childAspectRatio:
                              2 / 3.5, // Adjust the aspect ratio as needed
                          mainAxisSpacing: 10, // Space between rows
                          crossAxisSpacing: 10, // Space between columns
                        ),
                        itemCount: managectrl.getallplans
                            .where((element) =>
                                element.durationInMonths ==
                                managectrl.plandurations)
                            .length,
                        itemBuilder: (context, index) {
                          var filteredPlans = managectrl.getallplans
                              .where((element) =>
                                  element.durationInMonths ==
                                  managectrl.plandurations)
                              .toList();
                          var e = filteredPlans[index];

                          return SizedBox(
                            child: CardwithShadow(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 5),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  HeadingText(
                                    e.category,
                                    size: 16,
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
                                            "Rs ${e.price - (e.price * (e.discountPercentage / 100))}",
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                              "/${e.durationInMonths} ${e.durationInMonths <= 1 ? "month" : "months"}")
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      e.discountPercentage <= 0
                                          ? const SizedBox()
                                          : const Text(
                                              "Discount",
                                              style: TextStyle(
                                                color: Colors.white60,
                                              ),
                                            ),
                                      e.discountPercentage <= 0
                                          ? const SizedBox()
                                          : Text(
                                              "${e.discountPercentage}%",
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
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
                                          e.category.toLowerCase() == "personal"
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
                                          e.category.toLowerCase() == "personal"
                                              ? Text(
                                                  "Trainer Included",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .onSurface
                                                          .withOpacity(0.7)),
                                                )
                                              : Text(
                                                  "No Trainers",
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
                                          const Icon(Icons.check,
                                              color: Colors.green, size: 14),
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
                                        addmemberctrl.addplan(e);
                                        Get.toNamed("/login");
                                      },
                                      margin: EdgeInsets.zero,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      child: const Center(
                                        child: Text(
                                          "Choose Plan",
                                          style: TextStyle(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
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
