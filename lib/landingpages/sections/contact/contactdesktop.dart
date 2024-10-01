import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/landingpages/pages/contactuspage.dart';
import 'package:xtreme_fitness/landingpages/pages/responsivepages.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/editcontactinfo/contactcontroller.dart';

import '../../../config/apis.dart';
import '../../../widgets/cardswithshadow.dart';

class ContactDesktop extends StatelessWidget {
  const ContactDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ContactController>(builder: (contactctrl) {
      return SingleChildScrollView(
        child: ResponsivePages(
          issize: false,
          colors: const Color.fromARGB(255, 15, 15, 15),
          child1: SizedBox(
            // height: 900,
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                const ContactUsPage(),
                Container(
                  padding: EdgeInsets.only(
                      left: MediaQuery.sizeOf(context).width <= mobilescreen
                          ? 16
                          : 100,
                      right: MediaQuery.sizeOf(context).width <= mobilescreen
                          ? 16
                          : 100,
                      top: 30),
                  color: const Color.fromARGB(255, 15, 15, 15),
                  child: MediaQuery.sizeOf(context).width < mobilescreen
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Company",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                Text(
                                  "About Us",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white60),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Why Us",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white60),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Partnership",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white60),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 60,
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Services",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                Text(
                                  "BMI",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white60),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Steam Bath",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white60),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Massage Chair",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white60),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 60,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Help",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                const Text(
                                  "Account",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white60),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "Support Center",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white60),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: () async {
                                    final String url = 'https://$api/policies';
                                    js.context
                                        .callMethod('open', [url, '_blank']);
                                  },
                                  child: const Text(
                                    "Privacy Policy",
                                    style: TextStyle(color: Colors.white60),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 60,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Contact Us",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.phone,
                                        size: 16,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      contactctrl.contact!.phoneNumber!,
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.white60),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.email,
                                        size: 16,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "${contactctrl.contact!.email}",
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.white60),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.location_on,
                                        size: 16,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "${contactctrl.contact!.address!}, ${contactctrl.contact!.pinCode}",
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.white60),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  children: [
                                    // Padding(
                                    //   padding: const EdgeInsets.all(16.0),
                                    //   child: Row(
                                    //     mainAxisAlignment:
                                    //         MainAxisAlignment.center,
                                    //     children: [
                                    //       SizedBox(
                                    //           height: 50,
                                    //           child: Image.asset(
                                    //               "assets/logo1.png")),
                                    //       // const SizedBox(width: 10,),
                                    //       // const HeadingText("Xtreme",size: 18)
                                    //     ],
                                    //   ),
                                    // ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 32),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 50,
                                            width: 50,
                                            child: CardwithShadow(
                                              onpress: () {
                                                String url =
                                                    'https://www.facebook.com/xtremefitnessmantripukhri';
                                                js.context.callMethod(
                                                    'open', [url, '_blank']);
                                              },
                                              child: Image.asset(
                                                  "assets/facebook-logo.png"),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 30,
                                          ),
                                          SizedBox(
                                            height: 50,
                                            width: 50,
                                            child: CardwithShadow(
                                              onpress: () {
                                                String url =
                                                    'https://www.instagram.com/xtremefitness_imphal_manipur';
                                                js.context.callMethod(
                                                    'open', [url, '_blank']);
                                              },
                                              child: Image.asset(
                                                  "assets/instagram.png"),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 30,
                                          ),
                                          SizedBox(
                                            height: 50,
                                            width: 50,
                                            child: CardwithShadow(
                                              onpress: () {
                                                String url =
                                                    'https://twitter.com/Xtremefitness19';
                                                js.context.callMethod(
                                                    'open', [url, '_blank']);
                                              },
                                              child: Image.asset(
                                                  "assets/twiter.jpeg"),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 30,
                                          ),
                                          SizedBox(
                                            height: 50,
                                            width: 50,
                                            child: CardwithShadow(
                                              onpress: () {
                                                String url =
                                                    'https://www.youtube.com/@xtremefitnessimphal.2851';
                                                js.context.callMethod(
                                                    'open', [url, '_blank']);
                                              },
                                              child: Image.asset(
                                                  "assets/youtube.png"),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        )
                      : Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const FittedBox(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Company",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Text(
                                          "About Us",
                                          style:
                                              TextStyle(color: Colors.white60),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Why Us",
                                          style:
                                              TextStyle(color: Colors.white60),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Partnership",
                                          style:
                                              TextStyle(color: Colors.white60),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const FittedBox(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Services",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Text(
                                          "BMI",
                                          style:
                                              TextStyle(color: Colors.white60),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Steam Bath",
                                          style:
                                              TextStyle(color: Colors.white60),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Massage Chair",
                                          style:
                                              TextStyle(color: Colors.white60),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                  FittedBox(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Help",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        const Text(
                                          "Account",
                                          style:
                                              TextStyle(color: Colors.white60),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text(
                                          "Support Center",
                                          style:
                                              TextStyle(color: Colors.white60),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            final String url =
                                                'https://$api/policies';
                                            js.context.callMethod(
                                                'open', [url, '_blank']);
                                          },
                                          child: const Text(
                                            "Privacy Policy",
                                            style: TextStyle(
                                                color: Colors.white60),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                  FittedBox(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Contact Us",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.phone,
                                                size: 16,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              contactctrl.contact!.phoneNumber!,
                                              style: const TextStyle(
                                                  color: Colors.white60),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.email,
                                                size: 16,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              '${contactctrl.contact!.email}',
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white60),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.location_on,
                                                size: 16,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              '${contactctrl.contact!.address!}, ${contactctrl.contact!.pinCode!}',
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white60),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 18,
                              ),
                              const Divider(height: 1, color: Colors.white60),
                              SizedBox(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                          height: 50,
                                          child:
                                              Image.asset("assets/logo1.png")),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 32),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: 50,
                                              width: 50,
                                              child: CardwithShadow(
                                                onpress: () {
                                                  String url =
                                                      'https://www.facebook.com/xtremefitnessmantripukhri';
                                                  js.context.callMethod(
                                                      'open', [url, '_blank']);
                                                },
                                                child: Image.asset(
                                                    "assets/facebook-logo.png"),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 30,
                                            ),
                                            SizedBox(
                                              height: 50,
                                              width: 50,
                                              child: CardwithShadow(
                                                onpress: () {
                                                  String url =
                                                      'https://www.instagram.com/xtremefitness_imphal_manipur';
                                                  js.context.callMethod(
                                                      'open', [url, '_blank']);
                                                },
                                                child: Image.asset(
                                                    "assets/instagram.png"),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 30,
                                            ),
                                            SizedBox(
                                              height: 50,
                                              width: 50,
                                              child: CardwithShadow(
                                                onpress: () {
                                                  String url =
                                                      'https://twitter.com/Xtremefitness19';
                                                  js.context.callMethod(
                                                      'open', [url, '_blank']);
                                                },
                                                child: Image.asset(
                                                    "assets/twiter.jpeg"),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 30,
                                            ),
                                            SizedBox(
                                              height: 50,
                                              width: 50,
                                              child: CardwithShadow(
                                                onpress: () {
                                                  String url =
                                                      'https://www.youtube.com/@xtremefitnessimphal.2851';
                                                  js.context.callMethod(
                                                      'open', [url, '_blank']);
                                                },
                                                child: Image.asset(
                                                    "assets/youtube.png"),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
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
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[800],
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Contact Info
          const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Call us at: ',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Text(
                '1-800-123-4567',
                style: TextStyle(color: Colors.blueAccent, fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                'Email us at: ',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Text(
                'support@example.com',
                style: TextStyle(color: Colors.blueAccent, fontSize: 16),
              ),
              SizedBox(height: 16),
            ],
          ),

          // Support Links
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text('Chat with us live',
                    style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(width: 16),
              TextButton(
                onPressed: () {},
                child: const Text('Visit our Help Center',
                    style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(width: 16),
              TextButton(
                onPressed: () {},
                child: const Text('Give us your feedback',
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          ),

          // Social Media Links
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.facebook, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.facebook, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.face, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),

          // Additional Info
          const SizedBox(height: 16),
          const Text(
            'Support Hours: Mon-Fri, 9 AM - 6 PM EST',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(height: 8),
          const Text(
            'For accessibility support, please call 1-800-ACCESS',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(height: 8),
          const Text(
            'Our Office: 1234 Elm Street, Suite 100, City, State, ZIP',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),

          // Legal Links
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text('Terms of Service',
                    style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(width: 16),
              TextButton(
                onPressed: () {},
                child: const Text('Privacy Policy',
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
