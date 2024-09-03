
import 'package:flutter/material.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/widgets/radialbar.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';

import '../../../../widgets/titletext.dart';

class Dashboardchild5 extends StatelessWidget {
  const Dashboardchild5({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CardwithShadow(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleText("Activities"),
                    SizedBox(height: 5,),
                    Text("OverAll"),
                    
                  ],
                ),
                    
                  // DropdownButton(
                  //   underline: const SizedBox(),
                  //   hint:const Text("Week",style: TextStyle(fontSize: 10),),
                  //   value: 0,
                  //   items:List.generate(3, (index) => DropdownMenuItem(
                  //     value: index,
                  //     child: Text(dayslist[index],style: const TextStyle(fontSize: 10))),) , onChanged: (value) {  },)
                        
                          ],
                        ),
              ),
          Expanded(child: RadialBarScreen(waterLevellist: [100,40,80],))
        ],
      ),
    );
  }
}
