import 'package:flutter/material.dart';

import 'package:xtreme_fitness/landingpages/sections/home/homedesktop.dart';
import 'package:xtreme_fitness/landingpages/sections/home/homemobile.dart';
import 'package:xtreme_fitness/landingpages/sections/home/hometablet.dart';
import 'package:xtreme_fitness/responsive/responsive.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: HomeMobile(),
      tablet: HomeTablet(),
      desktop: HomeDesktop(),
    );
  }
}
