import 'package:flutter/material.dart';
import 'package:xtreme_fitness/landingpages/sections/prices/desktopprices.dart';
import 'package:xtreme_fitness/landingpages/sections/prices/mobileprices.dart';
import 'package:xtreme_fitness/landingpages/sections/prices/tabletprices.dart';
import 'package:xtreme_fitness/responsive/responsive.dart';

class PricesPage extends StatelessWidget {
  const PricesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: PricesMobile(),
      tablet: PricesTablet(),
      desktop: PricesDesktop(),
    );
  }
}
