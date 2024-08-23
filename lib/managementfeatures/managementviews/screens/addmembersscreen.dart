import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';
import 'package:xtreme_fitness/widgets/titletext.dart';

import '../../../widgets/headingtext.dart';

class AddMemberScreen extends StatelessWidget {
  const AddMemberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
     
      children: [
            const Padding(
          padding: EdgeInsets.all(16.0),
          child: HeadingText("Add Members",size: 30,),
        ),
        const Expanded(child: CardwithShadow(
          margin: EdgeInsets.all(16),
          child: Center(child: TitleText("Add Members"),))),
               const SizedBox(height: 100,)
      ],
    );
  }
}