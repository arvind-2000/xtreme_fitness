import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      legend: const Legend(
        isVisible: true, // Show the legend
        position: LegendPosition.right, // Position of the legend
        overflowMode: LegendItemOverflowMode.scroll, // Handle overflow
      ),
      series: <CircularSeries>[
        PieSeries<ChartData, String>(
          enableTooltip: true,
          dataSource: <ChartData>[
            ChartData('Personal Trainee', 12),
            ChartData('General Trainee', 45),
            ChartData('Inactive Trainee', 7),
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
          dataLabelSettings:
              const DataLabelSettings(isVisible: true), // Show data labels
        ),
      ],
    );
  }
}

class ChartData {
  ChartData(this.category, this.value);
  final String category;
  final double value;
}
