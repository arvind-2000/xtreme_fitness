import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../widgets/cardswithshadow.dart';
import '../../config/manageconfig.dart';

class GraphsWidget extends StatelessWidget {
  const GraphsWidget(
      {super.key,
      required this.charttype,
      required this.seriesdata,
      required this.ontap,
      this.ticklines = false,
      this.isyearly = false,
      this.axis = true,
      this.plotbands = true,
      this.threshold, this.tooltip});

  final ChartType charttype;
  final List<double> seriesdata;
  final Function(DateTime)? ontap;
  final bool ticklines;
  final bool isyearly;
  final bool axis;
  final bool plotbands;
  final double? threshold;
  final Widget Function(dynamic data,ChartPoint<dynamic> point,ChartSeries<dynamic, dynamic> series,int pointIndex,int seriesIndex)? tooltip;
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      zoomPanBehavior: ZoomPanBehavior(
          enableMouseWheelZooming: false,
          enablePanning: true,

          // maximumZoomLevel: 1,
          // enablePinching: true,

          zoomMode: ZoomMode.x,
          enableSelectionZooming: false),

      tooltipBehavior: TooltipBehavior(
          enable: true,
          builder:tooltip??(data, point, series, pointIndex, seriesIndex) =>
              CardwithShadow(
                padding: const EdgeInsets.all(8),
                child: SizedBox(
                  // height: 100,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("$data"),
                    ],
                  ),
                ),
              ),
          color: Theme.of(context).colorScheme.primary,
          textStyle: TextStyle(color: Theme.of(context).colorScheme.surface)),
      borderWidth: 0,

      borderColor: Colors.transparent,
      margin: EdgeInsets.zero,
      plotAreaBorderColor: Colors.transparent,
      plotAreaBorderWidth: 0,
      // title: ChartTitle(
      //   text: prov.graphDataList[0].name,
      //   alignment: ChartAlignment.near,
      //   borderWidth: 8
      // ),
      enableAxisAnimation: true,

      isTransposed: charttype == ChartType.line ? false : true,
      primaryYAxis: NumericAxis(
        // plotBands: [
        //   PlotBand(isVisible: plotbands,
        //   start:threshold??50,
        //   color: dangercolors.last.withOpacity(0.1)
        //   )
        // ],

        isVisible: axis,
        //  majorGridLines: const MajorGridLines(
        //    width: 0
        //  ),
        //  minorGridLines:const MinorGridLines(width: 0),
        axisLine: const AxisLine(width: 0),
        majorTickLines: const MajorTickLines(size: 0, width: 0),
        minorTickLines: const MinorTickLines(size: 0, width: 0),
        // maximum: 400,
        minimum: 0,

        axisLabelFormatter: (x) {
          return ChartAxisLabel("", const TextStyle());
        },

        //  desiredIntervals: 10,
        //    decimalPlaces: 0,
        //    minimum: 0.0,
        //    // interval: 50,
        //       maximum: 50,
      ),
      primaryXAxis: NumericAxis(
        isVisible: axis,
        majorGridLines: const MajorGridLines(width: 0),

        // axisLabelFormatter:(axisLabelRenderArgs) => ChartAxisLabel(isyearly?months[riverdetails[_logics.getMaxIndex2(riverdetails)].river[int.tryParse(axisLabelRenderArgs.text)??0].date.month-1]:axisLabelRenderArgs.text,const TextStyle()),
        interval: 1,
      ),

      series: [
        charttype == ChartType.line
            ? linecharts(data: seriesdata, color: Colors.green)
            : barcharts(
                data: seriesdata,
                color: Colors.grey[400]!,
              )
      ],
    );
  }
}

SplineAreaSeries<double, int> linecharts({
  required List<double> data,
  required Color color,
}) {
  return SplineAreaSeries(
      animationDelay: 1,
      animationDuration: 0.3,
      enableTooltip: true,
      markerSettings: MarkerSettings(
        isVisible: true,

        // color:color.withOpacity(0.4),
        borderWidth: 2,
        color: Colors.transparent,
        borderColor: color,
        shape: DataMarkerType.circle,
      ),
      borderColor: color.withOpacity(0.4),
      borderWidth: 1,
      cardinalSplineTension: 2,
      splineType: SplineType.cardinal,
      //   gradient:  LinearGradient(
      // stops: [0.3,1],
      //       colors: [color, Colors.transparent],
      //       begin: Alignment.topCenter,
      //       end: Alignment.bottomCenter),
      color: color.withOpacity(0.2),
      dataSource: data,
      xValueMapper: (datum, index) {
        return index;
      },
      yValueMapper: (d, i) => data[i]);
}

StackedBarSeries<double, int> barcharts({
  required List<double> data,
  required Color color,
}) {
  return StackedBarSeries(
      animationDelay: 1,
      animationDuration: 500,
      enableTooltip: true,
      // trackColor: Colors.grey.withOpacity(0.1),

      // onPointTap: (c){
      //     ontap(riversdata.river[c.pointIndex!].date);
      // },
      width: 0.7,
      isTrackVisible: false,
      spacing: 0.0,
      color: color,
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(4), topRight: Radius.circular(4)),
      dataSource: data,
      xValueMapper: (datum, index) {
        return index;
      },
      yValueMapper: (d, i) => data[i]);
}
