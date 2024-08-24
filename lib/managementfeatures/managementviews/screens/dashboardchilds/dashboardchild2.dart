import 'dart:math';

import 'package:flutter/material.dart';
import 'package:xtreme_fitness/managementfeatures/config/manageconfig.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/widgets/chartwidgets.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';

import '../../../../config/const.dart';
import '../../../../widgets/titletext.dart';

class DashboardChild2 extends StatelessWidget {
  const DashboardChild2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  CardwithShadow(
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
                    TitleText("Sales"),
                    SizedBox(height: 5,),
                    Text("Earnings"),
                    
                  ],
                ),
                    
                  DropdownButton(
                    underline: const SizedBox(),
                    hint:const Text("Week",style: TextStyle(fontSize: 10),),
                    value: 0,
                    items:List.generate(3, (index) => DropdownMenuItem(
                      value: index,
                      child: Text(dayslist[index],style: const TextStyle(fontSize: 10))),) , onChanged: (value) {  },)
                        
                          ],
                        ),
              ),
          Expanded(child: GraphsWidget(charttype: ChartType.line, seriesdata: List.generate(10, (index) => Random().nextInt(100).toDouble()), ontap: (v){},axis: false,))
        ],
      ),
    );
  }
}