import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/managementcontroller.dart';

import '../../../widgets/cardswithshadow.dart';

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // ManagementController controller = Get.put(ManagementController());
    return GetBuilder<ManagementController>(builder: (controller) {
      return SfCircularChart(
        onLegendTapped: (legendTapArgs) {},
        legend: const Legend(
          isVisible: true, // Show the legend
          position: LegendPosition.right, // Position of the legend
          overflowMode: LegendItemOverflowMode.scroll, // Handle overflow
        ),
  tooltipBehavior: TooltipBehavior(
          enable: true,
          builder:(data, point, series, pointIndex, seriesIndex) =>
              SizedBox(
                // height: 100,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("${data.value} Members"),
                  ],
                ),
              ),
          color: Theme.of(context).colorScheme.primary,
          textStyle: TextStyle(color: Theme.of(context).colorScheme.surface)),
     
        series: <CircularSeries>[
          PieSeries<ChartData, String>(
            enableTooltip: true,

            dataSource: <ChartData>[
              ChartData('Personal Trainee',
                  controller.allpersonalxtremer.length.toDouble()),
              ChartData('General Trainee',
                  (controller.allgeneralxtremer.length).toDouble()),
              ChartData('Inactive Trainee',
                  controller.allinactivextremer.length.toDouble()),
                   ChartData('Other',
                  (controller.getallXtremer.length -
                              (controller.allinactivextremer.length +
                                  controller.allgeneralxtremer.length +
                                  controller.allpersonalxtremer.length)).toDouble()),
            ],
            xValueMapper: (ChartData data, _) => data.category,
            yValueMapper: (ChartData data, _) => data.value,
            // Optional: set color for each segment
            pointColorMapper: (ChartData data, _) {
              switch (data.category) {
                case 'Personal Trainee':
                  return Color.fromARGB(255, 16, 209, 235);
                case 'General Trainee':
                  return Color.fromARGB(255, 45, 156, 219);
                case 'Inactive Trainee':
                  return Color.fromARGB(255,161, 85, 185);
                   case 'Other':
                  return Color.fromARGB(255, 22, 91, 170);
              }
              return null;
            },
            dataLabelSettings: const DataLabelSettings(
                // textStyle: TextStyle(fontSize: 16),
                isVisible: true,
                showZeroValue: false), // Show data labels
          ),
        ],
      );
    });
  }
}

class ChartData {
  ChartData(this.category, this.value);
  final String category;
  final double value;
}
