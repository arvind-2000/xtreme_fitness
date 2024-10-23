import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/authenicationfeatures/views/pages/dialogs/logindialog.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/landingpages/pages/responsivepages.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';
import 'package:xtreme_fitness/widgets/gradientbutton.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';

import '../../../widgets/titletext.dart';

class HomeDesktop extends StatefulWidget {
  const HomeDesktop({
    super.key,
  });

  @override
  State<HomeDesktop> createState() => _HomeDesktopState();
}

class _HomeDesktopState extends State<HomeDesktop> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            child: SizedBox(
                height: MediaQuery.sizeOf(context).width <= mobilescreen
                    ? 900
                    : 1000,
                width: MediaQuery.sizeOf(context).width,
                child: Image.asset(
                  'assets/gym.jpg',
                  fit: BoxFit.cover,
                  color: const Color.fromARGB(255, 16, 0, 2)
                      .withOpacity(0.9), // Darken the image with opacity
                  colorBlendMode:
                      BlendMode.darken, // Apply the darken blend mode
                ))),
        ResponsivePages(
            // screenheight: MediaQuery.sizeOf(context).height,
            screenheight:
                MediaQuery.sizeOf(context).width <= mobilescreen ? 900 : 1000,
            child1: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    HeadingText(
                      "Your Fitness, Your Way",
                      size: MediaQuery.sizeOf(context).width < mobilescreen
                          ? 40
                          : 60,
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
                      child: TitleText(
                        "Become a Member",
                        size: MediaQuery.sizeOf(context).width <= mobilescreen
                            ? 16
                            : 20,
                        // color: Color.fromARGB(255, 219, 218, 218),
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 400),
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
                                            UnderLineText(text:"5:00 AM - 11:00 AM"),
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
                                                UnderLineText(text:"3:00 PM - 8:00 PM"),
                                       
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
                                          UnderLineText(text:"5:00 AM - 11:00 AM"),
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
                                              UnderLineText(text:"3:00 PM - 8:00 PM"),
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

class UnderLineText extends StatefulWidget {
  const UnderLineText({
    super.key, required this.text,
  });
  final String text;
  @override
  State<UnderLineText> createState() => _UnderLineTextState();
}

class _UnderLineTextState extends State<UnderLineText> {
  bool hover = false;
  
  @override
  Widget build(BuildContext context) {
    return MouseRegion(

        onEnter: (e){
          setState(() {
            hover = true;
          });
        },
        onExit: (v){
              setState(() {
                hover = false;
              });
        },  
   
      child: Text(
       widget.text,
        style: TextStyle(
            fontSize: 16,
            color: hover?null:Colors.grey[500],
            fontWeight: FontWeight.bold,
            decoration: hover?TextDecoration.underline:null
            ),
      ),
    );
  }
}
