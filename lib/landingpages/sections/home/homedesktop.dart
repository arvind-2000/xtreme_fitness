import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/pages/dialogs/logindialog.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/landingpages/controllers/getxcontrol.dart';
import 'package:xtreme_fitness/landingpages/pages/responsivepages.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';
import 'package:xtreme_fitness/widgets/gradientbutton.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';

class HomeDesktop extends StatefulWidget {
  const HomeDesktop({
    super.key,
  });

  @override
  State<HomeDesktop> createState() => _HomeDesktopState();
}

class _HomeDesktopState extends State<HomeDesktop> {
  // final PageController _controller = PageController();

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) => _animateSlider());
  }

  // void _animateSlider() {
  //   Future.delayed(Duration(seconds: 5)).then((_) {
  //     int nextPage = _controller.page!.round() + 1;

  //     if (nextPage == 5) {
  //       nextPage = 0;
  //     }

  //     _controller
  //         .animateToPage(nextPage, duration: Duration(seconds: 3), curve: Curves.easeIn)
  //         .then((_) => _animateSlider());
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    GetxLandingcontroller landingcontroller = Get.put(GetxLandingcontroller());
    return Stack(
      children: [
        Positioned(
            child: SizedBox(
                height: 1000,
                width: MediaQuery.sizeOf(context).width,
                child: Image.asset(
                  'assets/backg.jpg',
                  fit: BoxFit.cover,
                ))),
        ResponsivePages(
            // screenheight: MediaQuery.sizeOf(context).height,
            screenheight: 1000,
            child1: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    HeadingText(
                      "Your Fitness, Your Way",
                      size: MediaQuery.sizeOf(context).width < mobilescreen
                          ? 60
                          : MediaQuery.sizeOf(context).width < 1600
                              ? 70
                              : 80,
                      color: Colors.white,
                      isbold: true,
                    ).animate().shimmer(
                          color: Colors.grey,
                          delay: const Duration(seconds: 1),
                          duration: const Duration(seconds: 2),
                          curve: Curves.easeIn,
                        ),
                    const SizedBox(
                      height: 60,
                    ),
                    RichText(
                      text: const TextSpan(children: [
                        TextSpan(
                          text:
                              "Revolutionize Your Workout Experience with Personalised Training\n",
                          style: TextStyle(fontSize: 16, color: Colors.white54),
                        ),
                        // TextSpan(text:"Xtreme Fitness",style:TextStyle(fontSize: MediaQuery.sizeOf(context).width<mobilescreen?30:40,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.secondary,fontFamily: "Montserrat") ,),
                      ]),
                    )
                        .animate()
                        .slideX(
                          begin: -1,
                          end: 0,
                        )
                        .fadeIn(),
                    const SizedBox(
                      height: 20,
                    ),
                    GradientButton(
                        onpress: () {
                          // Get.toNamed('/signupmobile');
                          Get.dialog(
                            barrierDismissible: false,
                            const LoginDialog(
                              signupdialog: true,
                            ),
                          );
                        },
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 32),
                        color: Theme.of(context).colorScheme.secondary,
                        child: const Text(
                          "Become a Member",
                          style: TextStyle(
                            fontSize:20,
                              color: Color.fromARGB(255, 219, 218, 218),
                              fontWeight: FontWeight.bold),
                        )),
                    const SizedBox(
                      height: 60,
                    ),
                    SizedBox(
                      child: CardwithShadow(
                          margin: EdgeInsets.zero,
                          padding: const EdgeInsets.all(16),
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.3),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const Row(
                                //  mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.alarm,
                                    size: 16,
                                    color: Colors.white60,
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  HeadingText(
                                    "Timing",
                                    size: 24,
                                    color: Colors.white60,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              MediaQuery.sizeOf(context).width <= mobilescreen
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            HeadingText(
                                              "Morning",
                                              color: Colors.white60,
                                              size: 16,
                                            ),
                                            Text(
                                              "5:00 AM - 11:00 AM",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 8),
                                          width: 50,
                                          height: 1,
                                          color: Colors.white54,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            HeadingText(
                                              "Evening",
                                              color: Colors.white60,
                                              size: 16,
                                            ),
                                            Text("3:00 PM - 8:00 PM",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                      ],
                                    )
                                  : Row(
                                      children: [
                                        const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            HeadingText(
                                              "Morning",
                                              color: Colors.white60,
                                              size: 16,
                                            ),
                                            Text(
                                              "5:00 AM - 11:00 AM",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 1,
                                              height: 50,
                                              color: Colors.white54,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            HeadingText(
                                              "Evening",
                                              color: Colors.white60,
                                              size: 16,
                                            ),
                                            Text("3:00 PM - 8:00 PM",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                      ],
                                    ),
                              const SizedBox(
                                height: 20,
                              )
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ),
            child2: const SizedBox()),
      ],
    );
  }
}
