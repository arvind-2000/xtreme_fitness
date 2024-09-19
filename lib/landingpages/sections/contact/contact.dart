import 'package:flutter/material.dart';
import 'package:xtreme_fitness/landingpages/sections/contact/contactdesktop.dart';
import 'package:xtreme_fitness/landingpages/sections/contact/contactmobile.dart';
import 'package:xtreme_fitness/landingpages/sections/contact/contacttablet.dart';
import 'package:xtreme_fitness/responsive/responsive.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ContactMobile(),
      tablet: ContactTablet(),
      desktop: ContactDesktop(),
    );
  }
}
