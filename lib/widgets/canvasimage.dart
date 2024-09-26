import 'package:flutter/material.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:photo_view/photo_view.dart';
class ImageWidget extends StatelessWidget {
  final int index;
  const ImageWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return PhotoView(
       imageProvider: AssetImage(galleryimages[index]),
        initialScale: 0.6,  
    );

    // CachedNetworkImage(
    //             fit: BoxFit.cover,
    //             progressIndicatorBuilder: (context, url, progress) => Center(
    //               child: CircularProgressIndicator(
    //                 value: progress.progress,
    //                 color: Theme.of(context).colorScheme.secondary,
    //               ),
    //             ),
    //             imageUrl:
    //                 url??'https://images.unsplash.com/photo-1532264523420-881a47db012d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9',
    //           );
  }
}
