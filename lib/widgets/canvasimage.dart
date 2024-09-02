import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return   CachedNetworkImage(
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, progress) => Center(
                  child: CircularProgressIndicator(
                    value: progress.progress,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                imageUrl:
                    'https://images.unsplash.com/photo-1532264523420-881a47db012d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9',
              );
  }
}