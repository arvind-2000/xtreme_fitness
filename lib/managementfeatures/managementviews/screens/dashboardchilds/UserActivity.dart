import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:xtreme_fitness/widgets/cardswithshadow.dart';

class UserActivityChart extends StatelessWidget {
  const UserActivityChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor:
      //     const Color(0xFF0E1E38), // Dark background like your image
      body: CardwithShadow(
        // color: const Color(0xFF1C2D4D), // Card background similar to image
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'User Activity',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'This Month',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '16,543',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
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
                plotAreaBorderWidth: 0,
                primaryXAxis: const CategoryAxis(
                  majorGridLines: MajorGridLines(width: 0),
                  axisLine: AxisLine(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                ),
                primaryYAxis: const NumericAxis(
                  minimum: 0,
                  maximum: 100,
                  interval: 20,
                  axisLine: AxisLine(width: 0),
                  majorTickLines: MajorTickLines(size: 0),
                  minorGridLines: MinorGridLines(width: 0),
                  labelStyle: TextStyle(color: Colors.white),
                ),
                series: [
                  // Current Data Line
                  LineSeries<ChartData, String>(
                    color: Colors.blue,
                    dataSource: getCurrentData(),
                    xValueMapper: (ChartData data, _) => data.day,
                    yValueMapper: (ChartData data, _) => data.value,
                    width: 2,
                    markerSettings: const MarkerSettings(isVisible: true),
                  ),
                  // Previous Data Line
                  LineSeries<ChartData, String>(
                    color: Colors.red,
                    dataSource: getPreviousData(),
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

  // Sample data for "Current"
  List<ChartData> getCurrentData() {
    return [
      ChartData('Mon', 35),
      ChartData('Tue', 28),
      ChartData('Wed', 34),
      ChartData('Thu', 80),
      ChartData('Fri', 60),
      ChartData('Sat', 50),
    ];
  }

  // Sample data for "Previous"
  List<ChartData> getPreviousData() {
    return [
      ChartData('Mon', 25),
      ChartData('Tue', 40),
      ChartData('Wed', 45),
      ChartData('Thu', 55),
      ChartData('Fri', 50),
      ChartData('Sat', 65),
    ];
  }
}

class ChartData {
  final String day;
  final double value;

  ChartData(this.day, this.value);
}
