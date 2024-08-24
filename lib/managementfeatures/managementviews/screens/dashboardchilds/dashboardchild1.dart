import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/managementfeatures/managementmodels/logics.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/managementcontroller.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';

import '../../../../widgets/titletext.dart';

class DashboardChild1 extends StatelessWidget {
  const DashboardChild1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ManagementController>(
      builder: (managectrl) {
        return CardwithShadow(
          child: Padding(
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
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text("Earnings",style: TextStyle(fontSize: 18),),
                  const SizedBox(height: 5,),
                    FittedBox(child: Text(Logics.totalamounts(managectrl.getallpayments, DateTime.now()).toStringAsFixed(0) ,style: const TextStyle(fontSize: 40),)),
                  ],
                )),
                const SizedBox(height: 10,),
                // CardwithShadow(
                //   margin: EdgeInsets.all(0),
                //   padding: EdgeInsets.all(8),
                  
                //   child:  Text("See More",style: TextStyle(color: Theme.of(context).colorScheme.secondary,fontWeight: FontWeight.bold),))
            
                
            
                ///trailing
              ],
            ),
          ),
        );
      }
    );
  }
}