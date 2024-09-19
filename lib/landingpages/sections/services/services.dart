import 'package:flutter/material.dart';
import 'package:xtreme_fitness/landingpages/sections/services/desktopservices.dart';
import 'package:xtreme_fitness/landingpages/sections/services/mobileservices.dart';
import 'package:xtreme_fitness/landingpages/sections/services/tabletservices.dart';
import 'package:xtreme_fitness/responsive/responsive.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ServicesMobile(),
      tablet: ServicesTablet(),
      desktop: ServicesDesktop(),
    );
  }
}
