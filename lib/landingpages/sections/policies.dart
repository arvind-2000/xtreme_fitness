import 'package:flutter/material.dart';
import 'package:xtreme_fitness/landingpages/sections/privacypolicypage/termandcondition.dart';

class Policies extends StatelessWidget {
  const Policies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
        child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: const TermAndCondition()),
      ),
    );
  }
}
