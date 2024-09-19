import 'package:flutter/material.dart';
import 'package:xtreme_fitness/landingpages/sections/gallery/gallerydesktop.dart';
import 'package:xtreme_fitness/landingpages/sections/gallery/gallerymobile.dart';
import 'package:xtreme_fitness/landingpages/sections/gallery/gallerytablet.dart';
import 'package:xtreme_fitness/responsive/responsive.dart';

class Gallery extends StatelessWidget {
  const Gallery({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: GalleryMobile(),
      tablet: Gallerytablet(),
      desktop: GalleryDesktop(),
    );
  }
}
