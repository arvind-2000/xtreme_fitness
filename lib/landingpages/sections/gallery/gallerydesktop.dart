import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/landingpages/controllers/getxcontrol.dart';
import 'package:xtreme_fitness/widgets/canvasimage.dart';
import 'package:xtreme_fitness/widgets/card.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';

class GalleryDesktop extends StatefulWidget {
  const GalleryDesktop({super.key});

  @override
  _GalleryDesktopState createState() => _GalleryDesktopState();
}

class _GalleryDesktopState extends State<GalleryDesktop> {
  int startIndex = 0; // Controls the visible starting index
  final int itemsPerPage = 3; // Number of images to show at once

  final onHoverActive = Matrix4.identity()..translate(0, -10, 0);
  final onHoverRemove = Matrix4.identity()..translate(0, 0, 0);

  @override
  Widget build(BuildContext context) {
    GetxLandingcontroller landctrl = Get.put(GetxLandingcontroller());
    return GetBuilder<GetxLandingcontroller>(builder: (_) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 100,
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
            const HeadingText(
              "Gym Spaces",
              size: 30,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 400,
              child: Row(
                children: [
                  // Left Button for Previous
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: startIndex == 0 // Disable when at the beginning
                        ? null
                        : () {
                            setState(() {
                              startIndex -= itemsPerPage;
                              if (startIndex < 0) {
                                startIndex = 0; // Avoid negative index
                              }
                            });
                          },
                  ),

                  // Grid of Images
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            3, // Number of columns (adjust if needed)
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 5 / 4,
                      ),
                      shrinkWrap: true,
                      itemCount:
                          (startIndex + itemsPerPage) <= galleryimages.length
                              ? itemsPerPage
                              : galleryimages.length -
                                  startIndex, // Remaining items
                      itemBuilder: (context, index) {
                        int currentIndex =
                            startIndex + index; // Adjust the index
                        return InkWell(
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
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
                                          index: currentIndex, // Correct index
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
                          child: MouseRegion(
                            onEnter: (_) => landctrl.onHoverimage(true, index),
                            onExit: (_) => landctrl.onHoverimage(false, index),
                            child: AnimatedContainer(
                              curve: Curves.easeInOut,
                              transform: landctrl.isHoveredimage
                                  ? landctrl.imagehoverindex == index
                                      ? onHoverActive
                                      : onHoverRemove
                                  : onHoverRemove,
                              width: landctrl.isHoveredimage
                                  ? landctrl.imagehoverindex == index
                                      ? 108
                                      : 100
                                  : 100,
                              height: landctrl.isHoveredimage
                                  ? landctrl.imagehoverindex == index
                                      ? 85
                                      : 80
                                  : 80,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 12.0),
                              decoration: BoxDecoration(
                                // color: appProvider.isDark ? Colors.grey[900] : Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: landctrl.isHoveredimage
                                    ? landctrl.imagehoverindex == index
                                        ? [
                                            BoxShadow(
                                              color:
                                                  Colors.red.withOpacity(0.4),
                                              blurRadius: 8.0,
                                              offset: const Offset(0.0, 0.0),
                                            )
                                          ]
                                        : [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withAlpha(100),
                                              blurRadius: 8.0,
                                              offset: const Offset(0.0, 0.0),
                                            )
                                          ]
                                    : [
                                        BoxShadow(
                                          color: Colors.black.withAlpha(100),
                                          blurRadius: 8.0,
                                          offset: const Offset(0.0, 0.0),
                                        )
                                      ],
                              ),
                              duration: const Duration(milliseconds: 300),
                              margin: EdgeInsets.zero,
                              child: ImageWidget(
                                index: currentIndex, // Correct index
                              ),
                            ),
                          ),
                        );

                        // CardwithShadow(
                        //   onpress: () {
                        //     // Logic for handling image press (dialog or fullscreen view)
                        //     Get.dialog(
                        //       useSafeArea: true,
                        //       barrierDismissible: true,
                        //       Dialog(
                        //         elevation: 2,
                        //         child: Stack(
                        //           children: [
                        //             Cardonly(
                        //               margin: EdgeInsets.zero,
                        //               padding: EdgeInsets.zero,
                        //               child: SizedBox(
                        //                 child: ImageWidget(
                        //                   index: currentIndex, // Correct index
                        //                 ),
                        //               ),
                        //             ),
                        //             Positioned(
                        //               right: 0,
                        //               top: 0,
                        //               child: Cardonly(
                        //                 padding: const EdgeInsets.all(8),
                        //                 color: Theme.of(context)
                        //                     .colorScheme
                        //                     .primary
                        //                     .withOpacity(0.6),
                        //                 child: IconButton(
                        //                   onPressed: () {
                        //                     Navigator.pop(context);
                        //                   },
                        //                   icon: const Icon(
                        //                     Icons.close,
                        //                     size: 14,
                        //                   ),
                        //                 ),
                        //               ),
                        //             )
                        //           ],
                        //         ),
                        //       ),
                        //     );
                        //   },
                        //   margin: EdgeInsets.zero,
                        //   padding: EdgeInsets.zero,
                        //   child: ImageWidget(
                        //     index: currentIndex, // Correct index
                        //   ),
                        // );
                      },
                    ),
                  ),

                  // Right Button for Next
                  IconButton(
                    icon: const Icon(Icons.arrow_forward),
                    onPressed: startIndex + itemsPerPage >= galleryimages.length
                        ? null // Disable when no more images
                        : () {
                            setState(() {
                              startIndex += itemsPerPage;
                              if (startIndex >= galleryimages.length) {
                                startIndex =
                                    galleryimages.length - itemsPerPage;
                              }
                            });
                          },
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
