import 'package:flutter/material.dart';

import '../../../../widgets/cardswithshadow.dart';
import '../../../../widgets/headingtext.dart';
import '../dashboardchilds/dashboardchild1.dart';
import '../dashboardchilds/dashboardchild2.dart';
import '../dashboardchilds/dashboardchild3.dart';
import '../dashboardchilds/dashboardchild4.dart';
import '../dashboardchilds/dashboardchild5.dart';

class DashboardDesktopScreen extends StatelessWidget {
  const DashboardDesktopScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // SizedBox(height: 80,
        // child: Row(),),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: HeadingText("OverView",size: 30,),
        ),
        Expanded(child: CardwithShadow(
          color: Colors.transparent,
      
          child:Row(
            children: [   
               Expanded(child: CardwithShadow(child:DashboardChild1(),)),
               SizedBox(width: 10,),
               Expanded(child: CardwithShadow(child: DashboardChild2())),
                 SizedBox(width: 10,),
               Expanded(child: CardwithShadow(child: DashboardChild3())),
                ],
    
          ))),
        Expanded(child: CardwithShadow(
       
          color: Colors.transparent,
          child: Row(
            children: [
               Expanded(
                 flex: 3,
                 child: CardwithShadow(child:  DashboardChild4(),)),
                   SizedBox(width: 10,),
               Expanded(
                 flex: 2,
                 child: CardwithShadow(child:  Dashboardchild5())),
            ],
          )))
      ],
    );
  }
}