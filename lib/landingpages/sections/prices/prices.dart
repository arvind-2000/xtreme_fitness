import 'package:flutter/material.dart';
import 'package:xtreme_fitness/landingpages/sections/prices/pricesdesktop.dart';
import 'package:xtreme_fitness/landingpages/sections/prices/pricesmobile.dart';
import 'package:xtreme_fitness/landingpages/sections/prices/pricestablet.dart';
import 'package:xtreme_fitness/responsive/responsive.dart';

class Prices extends StatelessWidget {
  const Prices({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: Pricesmobile(),
      tablet: PricesTablet(),
      desktop: Pricesdesktop(),
    );
  }
}
