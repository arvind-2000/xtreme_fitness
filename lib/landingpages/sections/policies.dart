import 'package:flutter/material.dart';
import 'package:xtreme_fitness/landingpages/sections/privacypolicypage/termandcondition.dart';


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