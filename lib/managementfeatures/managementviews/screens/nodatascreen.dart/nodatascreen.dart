import 'package:flutter/material.dart';
import 'package:xtreme_fitness/config/const.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';

import '../../../../widgets/titletext.dart';

class NodataScreen extends StatelessWidget {

  const NodataScreen({super.key, required this.title, required this.desc, this.onpress});

  final String title;
  final String desc;
  final VoidCallback? onpress;
  @override
  Widget build(BuildContext context) {
    return Center(
    child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

          TitleText(title,size: MediaQuery.sizeOf(context).width<=mobilescreen?20:null,),
          const SizedBox(height: 16,),
          Text(desc),
          const SizedBox(height: 20,),
          onpress!=null?CardwithShadow(
          onpress: onpress,
          child: const Text("Add")):const SizedBox()
        ],
      ),
    );
  }
}