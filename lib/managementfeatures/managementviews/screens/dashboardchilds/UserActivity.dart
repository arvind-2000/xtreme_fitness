import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/controllers/managementcontroller.dart';
import 'package:xtreme_fitness/managementfeatures/managementviews/screens/dashboardchilds/dashboardchild1.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';

class UserActivityChart extends StatelessWidget {
  const UserActivityChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ManagementController magctrl = Get.find<ManagementController>();
    DateTime currentDate = DateTime.now(); // Current date for calculations

    return Scaffold(
      body: CardwithShadow(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DashboardChild1(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Sales Activity',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 37, 0, 0),
                            borderRadius: BorderRadius.circular(15)),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 10),
                          child: Text(
                            'Weekly',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Row(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.blue,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Current',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(width: 16),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.red,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Previous',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: SfCartesianChart(
                tooltipBehavior: TooltipBehavior(
                  enable: true,
                  color: Theme.of(context).colorScheme.primary,
                  textStyle:
                      TextStyle(color: Theme.of(context).colorScheme.surface),
                  builder: (data, point, series, pointIndex, seriesIndex) {
                    ChartData chartData = data;
                    return SizedBox(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("₹ ${chartData.value.toStringAsFixed(0)}"),
                        ],
                      ),
                    );
                  },
                ),
                plotAreaBorderWidth: 0,
                primaryXAxis: const CategoryAxis(
                  majorGridLines: MajorGridLines(width: 0),
                  axisLine: AxisLine(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                ),
                primaryYAxis: const NumericAxis(
                  minimum: 0,
                  maximum: 30000, // Adjust this range as needed
                  interval: 2000,
                  axisLine: AxisLine(width: 0),
                  majorTickLines: MajorTickLines(size: 0),
                  minorGridLines: MinorGridLines(width: 0),
                  labelStyle: TextStyle(color: Colors.white),
                ),
                series: [
                  // Current Week Data Line
                  LineSeries<ChartData, String>(
                    enableTooltip: true,
                    color: Colors.blue,
                    dataSource: getDummyData('current'),

                    //  magctrl.getCurrentWeekData(currentDate),
                    xValueMapper: (ChartData data, _) => data.day,
                    yValueMapper: (ChartData data, _) => data.value,
                    width: 2,
                    markerSettings: const MarkerSettings(isVisible: true),
                  ),
                  // Previous Week Data Line
                  LineSeries<ChartData, String>(
                    enableTooltip: true,
                    color: Colors.red,
                    dataSource: getDummyData('prevoius'),
                    // magctrl.getPreviousWeekData(currentDate),
                    xValueMapper: (ChartData data, _) => data.day,
                    yValueMapper: (ChartData data, _) => data.value,
                    width: 2,
                    markerSettings: const MarkerSettings(isVisible: true),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChartData {
  final String day;
  final double value;

  ChartData(this.day, this.value);
}

List<ChartData> getDummyData(String weekType) {
  if (weekType == 'current') {
    return [
      ChartData('Mon', 15000), // 15,000
      ChartData('Tue', 22000), // 22,000
      ChartData('Wed', 28000), // 28,000
      ChartData('Thu', 30000), // 30,000 (Max)
      ChartData('Fri', 12000), // 12,000
      ChartData('Sat', 18000), // 18,000
      ChartData('Sun', 25000), // 25,000
    ];
  } else {
    return [
      ChartData('Mon', 13000), // 13,000
      ChartData('Tue', 24000), // 24,000
      ChartData('Wed', 29000), // 29,000
      ChartData('Thu', 26000), // 26,000
      ChartData('Fri', 17000), // 17,000
      ChartData('Sat', 30000), // 30,000 (Max)
      ChartData('Sun', 23000), // 23,000
    ];
  }
}
