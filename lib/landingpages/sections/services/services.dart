import 'package:flutter/material.dart';
import 'package:xtreme_fitness/landingpages/sections/services/servicesdesktop.dart';
import 'package:xtreme_fitness/landingpages/sections/services/servicesmobile.dart';
import 'package:xtreme_fitness/landingpages/sections/services/servicestablet.dart';
import 'package:xtreme_fitness/responsive/responsive.dart';

class ServicesPlanPage extends StatelessWidget {
  const ServicesPlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ServicesMobile(),
      tablet: ServicesTablet(),
      desktop: ServicesDesktop(),
    );
  }
}
