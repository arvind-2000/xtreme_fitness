import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/widgets/canvasimage.dart';
import 'package:xtreme_fitness/widgets/card.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';

class CarouselWithButtons extends StatefulWidget {
  const CarouselWithButtons({super.key});

  @override
  _CarouselWithButtonsState createState() => _CarouselWithButtonsState();
}

class _CarouselWithButtonsState extends State<CarouselWithButtons> {
  int startIndex = 0; // Controls the visible starting index
  final int itemsPerPage = 4; // Number of images to show at once

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Left Button for Previous
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: startIndex == 0 // Disable when at the beginning
              ? null
              : () {
                  setState(() {
                    startIndex -= itemsPerPage;
                    if (startIndex < 0) startIndex = 0; // Avoid negative index
                  });
                },
        ),

        // Grid of Images
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, // Number of columns (adjust if needed)
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 5 / 4,
            ),
            shrinkWrap: true,
            itemCount: (startIndex + itemsPerPage) <= galleryimages.length
                ? itemsPerPage
                : galleryimages.length - startIndex, // Remaining items
            itemBuilder: (context, index) {
              int currentIndex = startIndex + index; // Adjust the index
              return CardwithShadow(
                onpress: () {
                  // Logic for handling image press (dialog or fullscreen view)
                  Get.dialog(
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
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                child: ImageWidget(
                  index: currentIndex, // Correct index
                ),
              );
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
                      startIndex = galleryimages.length - itemsPerPage;
                    }
                  });
                },
        ),
      ],
    );
  }
}
