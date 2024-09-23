import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/pages/dialogs/mobile/logindialogmobile.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/addmemberscontrol.dart';
import 'package:xtreme_fitness/widgets/card.dart';
import 'package:xtreme_fitness/widgets/cardborder.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';

import '../../controllers/getxcontrol.dart';

class ServicesMobile extends StatelessWidget {
  const ServicesMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AddMemberController addmemberctrl = Get.put(AddMemberController());
    return GetBuilder<GetxLandingcontroller>(builder: (managectrl) {
      return Container(
        color: const Color.fromARGB(255, 36, 34, 34),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 100,
            ),
            const Center(
                child: HeadingText(
                    align: TextAlign.center,
                    "The Best Programs We\nOffers For You")),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 450,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Center(
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of items in a row
                      childAspectRatio: 470 /
                          MediaQuery.of(context)
                              .size
                              .width, // Adjust the aspect ratio as needed
                      mainAxisSpacing: 10, // Space between rows
                      crossAxisSpacing: 10, // Space between columns
                    ),
                    itemCount: managectrl
                        .getallservices.length, // Total number of items
                    itemBuilder: (context, index) {
                      var e = managectrl
                          .getallservices[index]; // Access the service

                      return Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: CardwithShadow(
                          onpress: () {},
                          margin: EdgeInsets.zero,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // HeadingText(
                              //   "${index < 9 ? "0" : ""}${index + 1}", // Display item number with leading zero
                              //   size: 25,
                              // ),
                              // const SizedBox(
                              //   height: 25,
                              // ),
                              HeadingText(
                                isbold: true,
                                e.name, // Service name
                                size: 16,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Xtremer"),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              "Rs ${e.memberPrice}", // Member price
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        TextSpan(
                                          text:
                                              "/ ${e.durationInMinutes} mins", // Duration
                                          style: const TextStyle(
                                              color: Colors.white38),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text("Non Xtremer"),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              "Rs ${e.nonMemberPrice}", // Non-member price
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        TextSpan(
                                          text:
                                              "/ ${e.durationInMinutes} mins", // Duration
                                          style: const TextStyle(
                                              color: Colors.white38),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CardBorder(
                                  onpress: () {
                                    Get.dialog(const LoginDialogMobile(
                                      signupdialog: true,
                                    ));
                                    addmemberctrl.addservices(e);
                                  },
                                  margin: EdgeInsets.zero,
                                  color: Colors.grey,
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Choose Service",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                        size: 14,
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                child: Cardonly(
                    margin:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 16),
                    color: Colors.orange,
                    child: FittedBox(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RichText(
                              text: const TextSpan(children: [
                            // const TextSpan(text: "Exclusive Offer\n\n",style: TextStyle(color: Colors.white,fontSize: 24)),
                            TextSpan(
                                text:
                                    "Exclusive Offer: Free BMI Service for First-time members only.",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold)),
                          ])),
                          const SizedBox(
                            height: 16,
                          ),
                          Cardonly(
                              onpress: () {
                                Get.dialog(const LoginDialogMobile(
                                  signupdialog: true,
                                ));
                              },
                              margin: EdgeInsets.zero,
                              color: Theme.of(context).colorScheme.secondary,
                              child: const Text(
                                "Claim Now",
                                style: TextStyle(color: Colors.white),
                              ))
                        ],
                      ),
                    )),
              ),
            ),
          ],
        ),
      );
    });
  }
}
