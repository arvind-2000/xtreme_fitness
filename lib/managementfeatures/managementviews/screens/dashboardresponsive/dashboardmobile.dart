import 'package:flutter/material.dart';

import '../../../../widgets/cardswithshadow.dart';
import '../dashboardchilds/dashboardchild1.dart';
import '../dashboardchilds/dashboardchild2.dart';
import '../dashboardchilds/dashboardchild3.dart';
import '../dashboardchilds/dashboardchild4.dart';
import '../dashboardchilds/dashboardchild5.dart';

class DashboardMobileScreen extends StatelessWidget {
  const DashboardMobileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
                  children: [ 
                    ///appbar heights
                    // SizedBox(height: 80,),  
                   SizedBox(
                     
                     height: 400,
                     child: CardwithShadow(child: DashboardChild1(),)),
                   SizedBox(height: 10,),
                   SizedBox(
                                 height: 400,
                     child: CardwithShadow(child: DashboardChild2(),)),
                     SizedBox(height: 10,),
                   SizedBox(
                                 height: 400,child: CardwithShadow(child: DashboardChild3(),)),
                                  SizedBox(height: 10,),
                                     SizedBox(
                                          height: 400,
                                       child: CardwithShadow(child: DashboardChild4(),)),
                       SizedBox(height: 10,),
                   SizedBox(
                        height: 400,
                     child: CardwithShadow(child: Dashboardchild5(),)),
                    ],
              ),
      ),
    );
  }
}
