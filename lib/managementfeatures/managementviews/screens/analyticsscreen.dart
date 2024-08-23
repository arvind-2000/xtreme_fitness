import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';
import 'package:xtreme_fitness/widgets/titletext.dart';

import '../../../widgets/headingtext.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: const Column(
               crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                 Padding(
          padding: EdgeInsets.all(16.0),
          child: HeadingText("Analytics",size: 30,),
        ),
            SizedBox(
              height: 500,
              child: CardwithShadow(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Center(child: TitleText("Analytics 1"),)),
            ),
                   SizedBox(
              height: 500,
              child: CardwithShadow(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Center(child: TitleText("Analytics 2"),)),
            ),
                   SizedBox(
              height: 500,
              child: CardwithShadow(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Center(child: TitleText("Analytics 3"),)),
            ),
                   SizedBox(
              height: 500,
              child: CardwithShadow(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Center(child: TitleText("Analytics 4"),)),
            ),
                   SizedBox(
              height: 500,
              child: CardwithShadow(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Center(child: TitleText("Analytics 5"),)),
            ),
                const SizedBox(height: 100,)
          ],
        ),
      ),
    );
  }
}