import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/landingpages/pages/responsivepages.dart';
import 'package:xtreme_fitness/widgets/card.dart';
import 'package:xtreme_fitness/widgets/cardborder.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';
import 'package:xtreme_fitness/widgets/gridviewwidget.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';

import '../../controllers/getxcontrol.dart';

class PricesMobile extends StatelessWidget {
  const PricesMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetxLandingcontroller>(builder: (managectrl) {
      return ResponsivePages(
        screenheight: 1000,
        colors: const Color.fromARGB(255, 36, 34, 34),
        child1: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              const HeadingText("The Best Programs We\nOffers For You"),
              const SizedBox(
                height: 50,
              ),
              GridViewWidget(
                size: MediaQuery.sizeOf(context).width,
                children: managectrl.getallservices
                    .asMap()
                    .entries
                    .map(
                      (e) => CardwithShadow(
                          onpress: () {},
                          margin: EdgeInsets.zero,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              HeadingText(
                                "${e.key < 10 ? "0" : ""}${e.key + 1}",
                                size: 40,
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              HeadingText(
                                e.value.name,
                                size: 24,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("Xtremer"),
                                    RichText(
                                        text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "Rs ${e.value.memberPrice}",
                                          style: const TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        TextSpan(
                                          text:
                                              "/ ${e.value.durationInMinutes} mins",
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
                                          text: "Rs ${e.value.nonMemberPrice}",
                                          style: const TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        TextSpan(
                                          text:
                                              "/ ${e.value.durationInMinutes} mins",
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
                              const CardBorder(
                                  margin: EdgeInsets.zero,
                                  color: Colors.grey,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Learn More",
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
                    )
                    .toList(),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.maxFinite,
                child: Cardonly(
                    margin:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
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
                                    Get.toNamed("/signup");
                                  },
                                  margin: EdgeInsets.zero,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  child: const Text(
                                    "Claim Now",
                                    style: TextStyle(color: Colors.white),
                                  ))
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    Get.toNamed("/signup");
                                  },
                                  margin: EdgeInsets.zero,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
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
      );
    });
  }
}
