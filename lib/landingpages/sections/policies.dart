import 'package:flutter/material.dart';
import 'package:xtreme_fitness/landingpages/sections/privacypolicypage/termandcondition.dart';
import 'package:xtreme_fitness/widgets/headingtext.dart';
import 'package:xtreme_fitness/widgets/titletext.dart';

import '../pages/responsivepages.dart';

class Policies extends StatelessWidget {
  const Policies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
     

        Center(
          child: ConstrainedBox(
           constraints: BoxConstraints(maxWidth: 800),
            child: TermAndCondition()),
        ),
        
    );
  }
}