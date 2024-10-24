import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/addmemberscontrol.dart';
import 'package:xtreme_fitness/widgets/card.dart';
import 'package:xtreme_fitness/widgets/cardborder.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';

import '../../../authenicationfeatures/views/pages/dialogs/logindialog.dart';
import '../../../widgets/titletext.dart';
import '../../controllers/getxcontrol.dart';

class ServicesDesktop extends StatelessWidget {
  const ServicesDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AddMemberController addmemberctrl = Get.put(AddMemberController());

    return GetBuilder<GetxLandingcontroller>(builder: (managectrl) {
      return Container(
        height: 800,
        padding: EdgeInsets.all(
            MediaQuery.sizeOf(context).width <= mobilescreen ? 16 : 0),
        color: const Color.fromARGB(255, 36, 34, 34),
        child: SizedBox(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width <= mobilescreen
                    ? null
                    : 100,
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HeadingText(
                          size: 30,
                          // align: TextAlign.left,
                          "The Best Programs"),
                      SizedBox(
                        height: 5,
                      ),
                      HeadingText(
                          size: 20,
                          // align: TextAlign.left,
                          "We Offers For You"),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 370,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //   crossAxisCount: MediaQuery.of(context).size.width < 1425
                  //       ? 3
                  //       : 4, // Number of items in a row
                  //   childAspectRatio:
                  //       3 / 3.3, // Adjust the aspect ratio as needed
                  //   mainAxisSpacing: 10, // Space between rows
                  //   crossAxisSpacing: 10, // Space between columns
                  // ),
                  itemCount:
                      managectrl.getallactiveservices.length, // Total number of items
                  itemBuilder: (context, index) {
                    var e =
                        managectrl.getallactiveservices[index]; // Access the service

                    return Padding(
                      padding: MediaQuery.sizeOf(context).width <= mobilescreen
                          ? const EdgeInsets.symmetric(horizontal: 16)
                          : const EdgeInsets.only(
                              left: 100, right: 16, bottom: 20),
                      child: SizedBox(
                        width: 300,
                        height: 400,
                        child: CardwithShadow(
                          
                            margin: EdgeInsets.zero,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HeadingText(
                                  "${index < 10 ? "0" : ""}${index + 1}",
                                  size: 40,
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                TitleText(
                                  e.name,
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
                                      const Text("Xtremer"),
                                      RichText(
                                          text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "$rupee ${e.memberPrice}",
                                            style: TextStyle(
                                                fontSize: 20,
                                             
                                                color: Colors.grey[400]),
                                          ),
                                          TextSpan(
                                            text:
                                                "/ ${e.durationInMinutes} mins",
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.white38),
                                          ),
                                        ],
                                      )),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text("Non Xtremer"),
                                      RichText(
                                          text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "$rupee ${e.nonMemberPrice}",
                                            style: TextStyle(
                                                fontSize: 20,
                                              
                                                color: Colors.grey[400]),
                                          ),
                                          TextSpan(
                                            text:
                                                "/ ${e.durationInMinutes} mins",
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.white38),
                                          ),
                                        ],
                                      )),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                CardBorder(
                                    onpress: () {
                                      Get.dialog(const LoginDialog(
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
                            )),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width <= mobilescreen
                        ? null
                        : 100,
                  ),
                  Expanded(
                    child: SizedBox(
                      // width: double.maxFinite,
                      child: Cardonly(
                          margin: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 16),
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
                                          Get.dialog(const LoginDialog(
                                            signupdialog: true,
                                          ));
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
                                          Get.dialog(const LoginDialog(
                                            signupdialog: true,
                                          ));
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
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width <= mobilescreen
                        ? null
                        : 100,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
