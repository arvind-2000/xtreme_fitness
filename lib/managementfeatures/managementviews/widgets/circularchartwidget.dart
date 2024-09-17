import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/managementcontroller.dart';

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ManagementController controller = Get.put(ManagementController());
    return GetBuilder<ManagementController>(builder: (_) {
      return SfCircularChart(
        onLegendTapped: (legendTapArgs) {},
        legend: const Legend(
          isVisible: true, // Show the legend
          position: LegendPosition.right, // Position of the legend
          overflowMode: LegendItemOverflowMode.scroll, // Handle overflow
        ),
        series: <CircularSeries>[
          PieSeries<ChartData, String>(
            enableTooltip: true,
            dataSource: <ChartData>[
              ChartData('Personal Trainee',
                  controller.allpersonalxtremerforoverall.length.toDouble()),
              ChartData(
                  'General Trainee',
                  (controller.getallxtremerforoverall.length -
                          controller.allpersonalxtremerforoverall.length)
                      .toDouble()),
              ChartData('Inactive Trainee',
                  controller.allinactivextremerforoverall.length.toDouble()),
            ],
            xValueMapper: (ChartData data, _) => data.category,
            yValueMapper: (ChartData data, _) => data.value,
            // Optional: set color for each segment
            pointColorMapper: (ChartData data, _) {
              switch (data.category) {
                case 'Personal Trainee':
                  return Colors.green;
                case 'General Trainee':
                  return Colors.blue;
                case 'Inactive Trainee':
                  return Colors.red;
              }
              return null;
            },
            dataLabelSettings: const DataLabelSettings(
                textStyle: TextStyle(fontSize: 20),
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
