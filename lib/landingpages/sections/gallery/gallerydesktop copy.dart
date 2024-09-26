import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/landingpages/controllers/getxcontrol.dart';
import 'package:xtreme_fitness/responsive/responsive.dart';
import 'package:xtreme_fitness/widgets/canvasimage.dart';
import 'package:xtreme_fitness/widgets/card.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';

import 'gallerydesktop.dart';

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
             Responsive.isMobile(context)||Responsive.isTablet(context)?GalleryPageView(controller: _controller)
             : 
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
              ),
              const SizedBox(
                height: 20,
              ),
             Responsive.isMobile(context)||Responsive.isTablet(context)?  Center(
                     child: SmoothPageIndicator(
                                    onDotClicked: (v){
                                     _controller.animateToPage(v, duration: Duration(milliseconds: 700),curve: Curves.linear);
                                    },
                                     controller: _controller,
                                     count: galleryimages.length,
                                     effect: WormEffect(
                                       dotHeight: 10,
                                       dotWidth: 10,
                                       activeDotColor: Theme.of(context).colorScheme.secondary,
                                      dotColor: Theme.of(context).colorScheme.secondary.withOpacity(0.4),  
                                       type: WormType.normal,
                                     ),
                                   ),
                   ):SizedBox(),
            ],
          ),
        ),
      );
    });
  }
}
class GalleryPageView extends StatelessWidget {
  const GalleryPageView({
    super.key,
    required PageController controller,
  }) : _controller = controller;

  final PageController _controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:MediaQuery.sizeOf(context).width<=mobilescreen?400:500,
      child: PageView.builder(
        controller: _controller,
        itemBuilder: (context, index) => Cardonly(
          onpress:(){
             Get.dialog(
                        useSafeArea: true,
                        barrierDismissible: true,
                        Dialog(
                             insetPadding: const EdgeInsets.all(16),
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
        child: ImageWidget(index: index)),itemCount: galleryimages.length,));
  }
}
