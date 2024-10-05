import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/userpaymentmodel.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/managementcontroller.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';

import '../../../../config/const.dart';
import '../../../../widgets/titletext.dart';
import '../../../config/manageconfig.dart';
import '../../widgets/chartwidgets.dart';

class DashboardChild3 extends StatelessWidget {
  const DashboardChild3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ManagementController>(
      builder: (managectrl) {
        return CardwithShadow(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
         Padding(
                padding: EdgeInsets.symmetric(vertical: 32.0,horizontal: 16),
                child:Row(

                  
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TitleText("Analytics"),
                 
                      Text("This Year",style: TextStyle(color: Colors.grey[500],fontSize: 12)),
                
                    
                  ],
                ),
              ),
             managectrl.filterpayments.isEmpty?const SizedBox():Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GraphsWidget(
                  charttype: ChartType.bar,
                  graphaxisnames: (axisLabelRenderArgs) => ChartAxisLabel(months[(managectrl.filterpayments.values.elementAt(int.tryParse(axisLabelRenderArgs.text)??0).last.paymentDate.month-1)%12],const TextStyle()),
                  tooltip: (data, point, series, pointIndex, seriesIndex) =>
              SizedBox(
                // height: 100,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(months[(managectrl.filterpayments.values.elementAt(pointIndex).last.paymentDate.month-1)%12]),
                    Text("Rs. ${data.toStringAsFixed(0)}"),
                  ],
                ),
              ),
                  seriesdata: managectrl.filterpayments.entries.map ((e){
                    double d = 0;
                    for(Alluserpaymentmodel x in e.value){

                        d = d + x.receivedAmount;

                    }

                       //print("in filter payment $d");
                    return d;
                    }).toList()
                     ,
                  ontap: (v) {},
                  axis: true,
                ),
              ))
            ],
          ),
        );
      }
    );
  }
}
