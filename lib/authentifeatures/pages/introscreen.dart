import 'package:flutter/material.dart';

import '../../widgets/titletext.dart';
import '../widgets/circlelogo.dart';


class IntroScreen extends StatelessWidget {
  const IntroScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 700),
      padding: const EdgeInsets.all(40),
             decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary
        ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            CircleLogo(),
        SizedBox(
            height: 60,
          ),
          TitleText("")
        ],
      ),
    );
  }
}


