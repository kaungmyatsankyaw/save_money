import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatelessWidget {
  final List<ChartData> cList;

  Chart({required this.cList});

  @override
  Widget build(BuildContext context) {
    return _buildDefaultDateTimeAxisChart();
  }

  /// Returns the line chart with default datetime axis.
  _buildDefaultDateTimeAxisChart() {
    return Card(
      child: Container(
        child: SfCartesianChart(
          title: ChartTitle(
              text: 'Income & Expense',
              textStyle: TextStyle(fontWeight: FontWeight.w400)),
          legend: Legend(
              isVisible: true,
              overflowMode: LegendItemOverflowMode.wrap,
              position: LegendPosition.bottom,
              isResponsive: true),
          plotAreaBorderWidth: 0,
          primaryXAxis: DateTimeAxis(
              title: AxisTitle(text: ''),
              labelIntersectAction: AxisLabelIntersectAction.multipleRows,
              labelAlignment: LabelAlignment.center,
              intervalType: DateTimeIntervalType.days,
              dateFormat: DateFormat('M-dd'),
              edgeLabelPlacement: EdgeLabelPlacement.none,
              majorGridLines: const MajorGridLines(width: 0),
              interval: 5),
          primaryYAxis: NumericAxis(
            axisLine: const AxisLine(width: 0),
            majorTickLines: const MajorTickLines(size: 0),
          ),
          series: _getDefaultDateTimeSeries(),
          tooltipBehavior: TooltipBehavior(enable: true),
        ),
      ),
    );
  }

  /// Returns the line chart with default data time axis.
  List<LineSeries<ChartData, DateTime>> _getDefaultDateTimeSeries() {
    return <LineSeries<ChartData, DateTime>>[
      LineSeries<ChartData, DateTime>(
        name: 'Income',
        dataSource: cList,
        xValueMapper: (ChartData data, _) => data.x as DateTime,
        yValueMapper: (ChartData data, _) => data.yValue,
        color: Color.fromRGBO(46, 139, 87, 0.6),
      ),
      LineSeries<ChartData, DateTime>(
        name: 'Expense',
        dataSource: cList,
        xValueMapper: (ChartData data, _) => data.x as DateTime,
        yValueMapper: (ChartData data, _) => data.y,
        color: Color.fromRGBO(255, 0, 0, 1),
      ),
    ];
  }
}

class ChartData {
  /// Holds the datapoint values like x, y, etc.,
  ChartData(
      {this.x,
      this.y,
      this.xValue,
      this.yValue,
      this.secondSeriesYValue,
      this.thirdSeriesYValue,
      this.pointColor,
      this.size,
      this.text,
      this.open,
      this.close,
      this.low,
      this.high,
      this.volume});

  /// Holds x value of the datapoint
  final dynamic x;

  /// Holds y value of the datapoint
  final num? y;

  /// Holds x value of the datapoint
  final dynamic xValue;

  /// Holds y value of the datapoint
  final num? yValue;

  /// Holds y value of the datapoint(for 2nd series)
  final num? secondSeriesYValue;

  /// Holds y value of the datapoint(for 3nd series)
  final num? thirdSeriesYValue;

  /// Holds point color of the datapoint
  final Color? pointColor;

  /// Holds size of the datapoint
  final num? size;

  /// Holds datalabel/text value mapper of the datapoint
  final String? text;

  /// Holds open value of the datapoint
  final num? open;

  /// Holds close value of the datapoint
  final num? close;

  /// Holds low value of the datapoint
  final num? low;

  /// Holds high value of the datapoint
  final num? high;

  /// Holds open value of the datapoint
  final num? volume;
}
