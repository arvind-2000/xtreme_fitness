import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/widgets/card.dart';
import 'package:xtreme_fitness/widgets/cardborder.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';

import '../../../authenicationfeatures/views/pages/dialogs/logindialog.dart';
import '../../controllers/getxcontrol.dart';

class ServicesMobile extends StatelessWidget {
  const ServicesMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetxLandingcontroller>(builder: (managectrl) {
      return Container(
        color: const Color.fromARGB(255, 36, 34, 34),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              flex: 2,
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Center(
                      child: HeadingText(
                          align: TextAlign.center,
                          "The Best Programs We\nOffers For You")),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Number of items in a row
                          childAspectRatio:
                              2 / 2.3, // Adjust the aspect ratio as needed
                          mainAxisSpacing: 16, // Space between rows
                          crossAxisSpacing: 16, // Space between columns
                        ),
                        itemCount: managectrl
                            .getallservices.length, // Total number of items
                        itemBuilder: (context, index) {
                          var e = managectrl
                              .getallservices[index]; // Access the service

                          return CardwithShadow(
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
                                  e.name, // Service name
                                  size: 24,
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
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          TextSpan(
                                            text:
                                                "/ ${e.durationInMinutes} mins", // Duration
                                            style: const TextStyle(
                                                fontSize: 14,
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
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          TextSpan(
                                            text:
                                                "/ ${e.durationInMinutes} mins", // Duration
                                            style: const TextStyle(
                                                fontSize: 14,
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
                                const CardBorder(
                                  margin: EdgeInsets.zero,
                                  color: Colors.grey,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Learn More", // Button text
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        Icons
                                            .arrow_forward, // Forward arrow icon
                                        color: Colors.white,
                                        size: 14,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      child: Cardonly(
                          margin: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 0),
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 16),
                          color: Colors.orange,
                          child: MediaQuery.sizeOf(context).width < mobilescreen
                              ? Column(
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
                                       Get.dialog(const LoginDialog(signupdialog: true,));
                                        },
                                        margin: EdgeInsets.zero,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        child: const Text(
                                          "Claim Now",
                                          style: TextStyle(color: Colors.white),
                                        ))
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                    Cardonly(
                                        onpress: () {
                                           Get.dialog(const LoginDialog(signupdialog: true,));
                                        },
                                        margin: EdgeInsets.zero,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        child: const Text(
                                          "Claim Now",
                                          style: TextStyle(color: Colors.white),
                                        ))
                                  ],
                                )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
