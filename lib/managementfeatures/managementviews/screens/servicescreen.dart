import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:xtreme_fitness/config/const.dart';

import '../../../widgets/cardswithshadow.dart';
import '../../../widgets/headingtext.dart';
import '../../../widgets/titletext.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.sizeOf(context).width;
    return  Column(
           crossAxisAlignment: CrossAxisAlignment.start,

      children: [
      Padding(
          padding: EdgeInsets.all(16.0),
          child: HeadingText("Services",size: 30,),
        ),
        Expanded(child:GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: size<500?1:size<mobilescreen?2: 4,
        mainAxisSpacing: 10,

        childAspectRatio:  size<500?1:3/4,

        ),
        children:List.generate(5,(index) => CardwithShadow(
          margin: EdgeInsets.all(16),
          child: Center(child: Text("Service $index"))))..add(CardwithShadow(
            color:Colors.blue,
            onpress: (){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Add Service"),));
            },
          margin: EdgeInsets.all(16),
          child: Center(child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add,size: 14,),
              SizedBox(width: 5,),
              Text("ADD SERVICE"),
            ],
          ),)))
        )
       
        ),
          
          
         const SizedBox(height: 100,)
      ],
    );
  }
}