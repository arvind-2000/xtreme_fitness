import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RadialBarScreen extends StatelessWidget {
  const RadialBarScreen({
    super.key,
    required this.waterLevellist,
  });

  final List<double> waterLevellist;

  @override
  Widget build(BuildContext context) {
    // log('${waterLevellist}');
    return SfCircularChart(
      
      series:waterLevellist.map((e) =>  RadialBarSeries(
        animationDuration: 800,
        strokeWidth: 0.5,
          useSeriesColor: true,
          trackOpacity: 0.3,
          // strokeColor: Theme.of(context).colorScheme.secondary,
        innerRadius:'30',
        cornerStyle: CornerStyle.bothCurve,    
        xValueMapper: (c,i){
        return i;
      }, yValueMapper:(c,i){
     
        return e*0.11;
      },
      maximumValue: 100,
    dataSource: waterLevellist,
      )).toList()
    );
  }
}