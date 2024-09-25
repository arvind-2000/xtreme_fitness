import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/landingpages/controllers/getxcontrol.dart';
import 'package:xtreme_fitness/widgets/canvasimage.dart';
import 'package:xtreme_fitness/widgets/card.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';

class GalleryDesktopCopy extends StatefulWidget {
  const GalleryDesktopCopy({super.key});

  @override
  _GalleryDesktopCopyState createState() => _GalleryDesktopCopyState();
}

class _GalleryDesktopCopyState extends State<GalleryDesktopCopy> {
  final PageController _controller =
      PageController(viewportFraction: 0.8, initialPage: 1);
  int startIndex = 0; // Controls the visible starting index
  final int itemsPerPage = 3; // Number of images to show at once

  final onHoverActive = Matrix4.identity()..translate(0, -10, 0);
  final onHoverRemove = Matrix4.identity()..translate(0, 0, 0);

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) => _animateSlider());
  }

  void _animateSlider() {
    Future.delayed(const Duration(seconds: 5)).then((_) {
      int nextPage = _controller.page!.round() + 1;

      if (nextPage == 5) {
        nextPage = 0;
      }

      _controller
          .animateToPage(nextPage,
              duration: const Duration(seconds: 3), curve: Curves.easeIn)
          .then((_) => _animateSlider());
    });
  }

  final CarouselSliderController carouselcontroller =
      CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    GetxLandingcontroller landctrl = Get.put(GetxLandingcontroller());
    return GetBuilder<GetxLandingcontroller>(builder: (_) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: SizedBox(
          // height:  MediaQuery.sizeOf(context).width<=mobilescreen?null:  800,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              const SizedBox(
                height: 100,
                child: Center(
                  child: HeadingText(
                    "Gallery",
                    size: 60,
                    isbold: true,
                  ),
                ),
              ),
              const Center(
                child: HeadingText(
                  "Gym Spaces",
                  size: 30,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.sizeOf(context).width <= mobilescreen
                    ? 400
                    : 550,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 40,
                    ),
                    IconButton(
                      onPressed: () {
                        carouselcontroller.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      icon: const Icon(
                        Icons.chevron_left_sharp,
                        size: 25,
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Expanded(
                      child: CarouselSlider.builder(
                        carouselController: carouselcontroller,
                        itemCount: galleryimages.length,
                        itemBuilder:
                            (BuildContext context, int index, int realIndex) {
                          return Cardonly(
                              onpress: () {
                                Get.dialog(
                                  useSafeArea: true,
                                  barrierDismissible: true,
                                  Dialog(
                                    elevation: 2,
                                    child: Stack(
                                      children: [
                                        Cardonly(
                                          margin: EdgeInsets.zero,
                                          padding: EdgeInsets.zero,
                                          child: SizedBox(
                                            child: ImageWidget(
                                              index: index, // Correct index
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          right: 0,
                                          top: 0,
                                          child: Cardonly(
                                            padding: const EdgeInsets.all(8),
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary
                                                .withOpacity(0.6),
                                            child: IconButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              icon: const Icon(
                                                Icons.close,
                                                size: 14,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                              padding: EdgeInsets.zero,
                              child: ImageWidget(index: index));
                        },
                        options: CarouselOptions(
                          height: 400,
                          autoPlay: true, // Enable auto-scrolling
                          autoPlayInterval: const Duration(
                              seconds:
                                  3), // Set the interval for auto-scrolling
                          enlargeCenterPage:
                              false, // Optional: Enlarge the center image
                          viewportFraction: 0.35, // Show one image at a time
                          aspectRatio: 5 / 9, // Adjust aspect ratio
                          initialPage: 0, // Start at the first page
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    IconButton(
                      onPressed: () {
                        carouselcontroller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      icon: const Icon(
                        Icons.chevron_right_sharp,
                        size: 25,
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                  ],
                ),

                //  PageView.builder(
                //   controller: _controller,
                //   itemBuilder: (context, index) => Cardonly(
                //       onpress: () {
                //         Get.dialog(
                //           useSafeArea: true,
                //           barrierDismissible: true,
                //           Dialog(
                //             elevation: 2,
                //             child: Stack(
                //               children: [
                //                 Cardonly(
                //                   margin: EdgeInsets.zero,
                //                   padding: EdgeInsets.zero,
                //                   child: SizedBox(
                //                     child: ImageWidget(
                //                       index: index, // Correct index
                //                     ),
                //                   ),
                //                 ),
                //                 Positioned(
                //                   right: 0,
                //                   top: 0,
                //                   child: Cardonly(
                //                     padding: const EdgeInsets.all(8),
                //                     color: Theme.of(context)
                //                         .colorScheme
                //                         .primary
                //                         .withOpacity(0.6),
                //                     child: IconButton(
                //                       onPressed: () {
                //                         Navigator.pop(context);
                //                       },
                //                       icon: const Icon(
                //                         Icons.close,
                //                         size: 14,
                //                       ),
                //                     ),
                //                   ),
                //                 )
                //               ],
                //             ),
                //           ),
                //         );
                //       },
                //       padding: EdgeInsets.zero,
                //       child: ImageWidget(index: index)),
                //   itemCount: galleryimages.length,
                // )
              ),
              const SizedBox(
                height: 50,
              ),
              // Center(
              //   child: SizedBox(

              //     child: Row(
              //       children: [
              //         // Left Button for Previous
              //            MediaQuery.sizeOf(context).width<=mobilescreen?SizedBox():IconButton(
              //           icon: const Icon(Icons.arrow_back),
              //           onPressed: startIndex == 0 // Disable when at the beginning
              //               ? null
              //               : () {
              //                   setState(() {
              //                     startIndex -= itemsPerPage;
              //                     if (startIndex < 0) {
              //                       startIndex = 0; // Avoid negative index
              //                     }
              //                   });
              //                 },
              //         ),

              //         // Grid of Images
              //         GridView.builder(
              //           gridDelegate:
              //                SliverGridDelegateWithFixedCrossAxisCount(
              //             crossAxisCount:
              //                MediaQuery.sizeOf(context).width<=mobilescreen?1:3, // Number of columns (adjust if needed)
              //             crossAxisSpacing: 16,
              //             mainAxisSpacing: 16,
              //             childAspectRatio: 5 / 4,
              //           ),
              //           shrinkWrap: true,
              //           scrollDirection:  Axis.vertical,
              //           itemCount:
              //               (startIndex + itemsPerPage) <= galleryimages.length
              //                   ? itemsPerPage
              //                   : galleryimages.length -
              //                       startIndex, // Remaining items
              //           itemBuilder: (context, index) {
              //             int currentIndex =
              //                 startIndex + index; // Adjust the index
              //             return Padding(
              //               padding: const EdgeInsets.all(16.0),
              //               child: InkWell(
              //                 hoverColor: Colors.transparent,
              //                 splashColor: Colors.transparent,
              //                 highlightColor: Colors.transparent,
              //                 onTap: () {
              //                   Get.dialog(
              //                     useSafeArea: true,
              //                     barrierDismissible: true,
              //                     Dialog(
              //                       elevation: 2,
              //                       child: Stack(
              //                         children: [
              //                           Cardonly(
              //                             margin: EdgeInsets.zero,
              //                             padding: EdgeInsets.zero,
              //                             child: SizedBox(
              //                               child: ImageWidget(
              //                                 index: currentIndex, // Correct index
              //                               ),
              //                             ),
              //                           ),
              //                           Positioned(
              //                             right: 0,
              //                             top: 0,
              //                             child: Cardonly(
              //                               padding: const EdgeInsets.all(8),
              //                               color: Theme.of(context)
              //                                   .colorScheme
              //                                   .primary
              //                                   .withOpacity(0.6),
              //                               child: IconButton(
              //                                 onPressed: () {
              //                                   Navigator.pop(context);
              //                                 },
              //                                 icon: const Icon(
              //                                   Icons.close,
              //                                   size: 14,
              //                                 ),
              //                               ),
              //                             ),
              //                           )
              //                         ],
              //                       ),
              //                     ),
              //                   );
              //                 },
              //                 child: MouseRegion(
              //                   onEnter: (_) => landctrl.onHoverimage(true, index),
              //                   onExit: (_) => landctrl.onHoverimage(false, index),
              //                   child: AnimatedContainer(
              //                     curve: Curves.easeInOut,
              //                     transform: landctrl.isHoveredimage
              //                         ? landctrl.imagehoverindex == index
              //                             ? onHoverActive
              //                             : onHoverRemove
              //                         : onHoverRemove,
              //                     width: landctrl.isHoveredimage
              //                         ? landctrl.imagehoverindex == index
              //                             ? 108
              //                             : 100
              //                         : 100,
              //                     height: landctrl.isHoveredimage
              //                         ? landctrl.imagehoverindex == index
              //                             ? 85
              //                             : 80
              //                         : 80,
              //                     padding: const EdgeInsets.symmetric(
              //                         vertical: 8.0, horizontal: 12.0),
              //                     decoration: BoxDecoration(
              //                       // color: appProvider.isDark ? Colors.grey[900] : Colors.white,
              //                       borderRadius: BorderRadius.circular(15),
              //                       boxShadow: landctrl.isHoveredimage
              //                           ? landctrl.imagehoverindex == index
              //                               ? [
              //                                   BoxShadow(
              //                                     color:
              //                                         Colors.red.withOpacity(0.4),
              //                                     blurRadius: 8.0,
              //                                     offset: const Offset(0.0, 0.0),
              //                                   )
              //                                 ]
              //                               : [
              //                                   BoxShadow(
              //                                     color:
              //                                         Colors.black.withAlpha(100),
              //                                     blurRadius: 8.0,
              //                                     offset: const Offset(0.0, 0.0),
              //                                   )
              //                                 ]
              //                           : [
              //                               BoxShadow(
              //                                 color: Colors.black.withAlpha(100),
              //                                 blurRadius: 8.0,
              //                                 offset: const Offset(0.0, 0.0),
              //                               )
              //                             ],
              //                     ),
              //                     duration: const Duration(milliseconds: 300),
              //                     margin: EdgeInsets.zero,
              //                     child: ImageWidget(
              //                       index: currentIndex, // Correct index
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //             );

              //             // CardwithShadow(
              //             //   onpress: () {
              //             //     // Logic for handling image press (dialog or fullscreen view)
              //             //     Get.dialog(
              //             //       useSafeArea: true,
              //             //       barrierDismissible: true,
              //             //       Dialog(
              //             //         elevation: 2,
              //             //         child: Stack(
              //             //           children: [
              //             //             Cardonly(
              //             //               margin: EdgeInsets.zero,
              //             //               padding: EdgeInsets.zero,
              //             //               child: SizedBox(
              //             //                 child: ImageWidget(
              //             //                   index: currentIndex, // Correct index
              //             //                 ),
              //             //               ),
              //             //             ),
              //             //             Positioned(
              //             //               right: 0,
              //             //               top: 0,
              //             //               child: Cardonly(
              //             //                 padding: const EdgeInsets.all(8),
              //             //                 color: Theme.of(context)
              //             //                     .colorScheme
              //             //                     .primary
              //             //                     .withOpacity(0.6),
              //             //                 child: IconButton(
              //             //                   onPressed: () {
              //             //                     Navigator.pop(context);
              //             //                   },
              //             //                   icon: const Icon(
              //             //                     Icons.close,
              //             //                     size: 14,
              //             //                   ),
              //             //                 ),
              //             //               ),
              //             //             )
              //             //           ],
              //             //         ),
              //             //       ),
              //             //     );
              //             //   },
              //             //   margin: EdgeInsets.zero,
              //             //   padding: EdgeInsets.zero,
              //             //   child: ImageWidget(
              //             //     index: currentIndex, // Correct index
              //             //   ),
              //             // );
              //           },
              //         ),

              //         // Right Button for Next
              //        MediaQuery.sizeOf(context).width<=mobilescreen?SizedBox():  IconButton(
              //           icon: const Icon(Icons.arrow_forward),
              //           onPressed: startIndex + itemsPerPage >= galleryimages.length
              //               ? null // Disable when no more images
              //               : () {
              //                   setState(() {
              //                     startIndex += itemsPerPage;
              //                     if (startIndex >= galleryimages.length) {
              //                       startIndex =
              //                           galleryimages.length - itemsPerPage;
              //                     }
              //                   });
              //                 },
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      );
    });
  }
}
