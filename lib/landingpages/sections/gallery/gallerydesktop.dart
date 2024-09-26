import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/landingpages/controllers/getxcontrol.dart';
import 'package:xtreme_fitness/widgets/canvasimage.dart';
import 'package:xtreme_fitness/widgets/card.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'gallerydesktop copy.dart';


class GalleryDesktop extends StatefulWidget {
  const GalleryDesktop({super.key});

  @override
  _GalleryDesktopState createState() => _GalleryDesktopState();
}

class _GalleryDesktopState extends State<GalleryDesktop> {
PageController _controller = PageController(viewportFraction:0.5, initialPage: 1);
     
  int startIndex = 0; // Controls the visible starting index
  final int itemsPerPage = 3; // Number of images to show at once

  final onHoverActive = Matrix4.identity()..translate(0, -10, 0);
  final onHoverRemove = Matrix4.identity()..translate(0, 0, 0);

  @override
  void initState() {
    super.initState();
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
   
    });
  }

  void _animateSlider() {
    Future.delayed(const Duration(seconds: 5)).then((_) {
      int nextPage = _controller!.page!.round() + 1;

      if (nextPage == 5) {
        nextPage = 0;
      }

      _controller!
          .animateToPage(nextPage,
              duration: const Duration(seconds: 3), curve: Curves.easeIn)
          .then((_) => _animateSlider());
    });
  }

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
              GalleryPageView(controller: _controller),
                    const SizedBox(
                height: 20,
              ),
            

                   Center(
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
                   ),
            ],
          ),
        ),
      );
    });
  }
}

