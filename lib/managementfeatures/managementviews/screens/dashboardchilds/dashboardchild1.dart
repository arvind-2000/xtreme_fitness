import 'package:flutter/material.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';

import '../../../../widgets/titletext.dart';

class DashboardChild1 extends StatelessWidget {
  const DashboardChild1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //title
          const Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleText("Today"),
                  SizedBox(height: 10,),
                  Text("21/7/2024"),
                
                ],
              ),
      
          
            ],
          ),
          // body
          const Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Earnings",style: TextStyle(fontSize: 18),),
            SizedBox(height: 5,),
              FittedBox(child: Text("Rs 25000",style: TextStyle(fontSize: 40),)),
            ],
          )),
          const SizedBox(height: 10,),
          SizedBox(height: 50,
          child: CardwithShadow(
            
            color: Theme.of(context).colorScheme.secondary,
            child: const Text("See More")),)
      
          
      
          ///trailing
        ],
      ),
    );
  }
}