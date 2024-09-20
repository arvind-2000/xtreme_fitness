import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/landingpages/controllers/getxcontrol.dart';
import 'package:xtreme_fitness/widgets/canvasimage.dart';
import 'package:xtreme_fitness/widgets/card.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';

class GalleryTablet extends StatefulWidget {
  const GalleryTablet({super.key});

  @override
  _GalleryTabletState createState() => _GalleryTabletState();
}

class _GalleryTabletState extends State<GalleryTablet> {
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
                  size: 50,
                  isbold: true,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns (adjust if needed)
                  crossAxisSpacing: 35,
                  mainAxisSpacing: 35,
                  childAspectRatio: 5 / 4,
                ),
                shrinkWrap: true,
                itemCount: galleryimages.length,
                itemBuilder: (context, index) {
                  int currentIndex = startIndex + index; // Adjust the index
                  return InkWell(
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
                    child: Container(
                      decoration: BoxDecoration(
                        // color: appProvider.isDark ? Colors.grey[900] : Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ImageWidget(
                        index: currentIndex, // Correct index
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
