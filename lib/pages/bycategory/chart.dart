import 'package:app/pages/bycategory/no_data.dart';
import 'package:app/providers/chart_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CircularChart extends StatefulWidget {
  CircularChart();

  @override
  _CircularChartState createState() => _CircularChartState();
}

class _CircularChartState extends State<CircularChart> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ChartProvider>(builder: (context, data, w) {
      return data.dataList.length != 0
          ? _buildLegendDefaultChart(data.dataList)
          : NoData();
    });
  }

  _buildLegendDefaultChart(data) {
    return Card(
      child: SfCircularChart(
        legend: Legend(
            position: LegendPosition.bottom,
            isVisible: true,
            toggleSeriesVisibility: true,
            overflowMode: LegendItemOverflowMode.wrap,
            textStyle: TextStyle(fontWeight: FontWeight.bold)),
        series: _getLegendDefaultSeries(data),
        tooltipBehavior: TooltipBehavior(
            enable: true, activationMode: ActivationMode.singleTap),
      ),
    );
  }

  ///Get the default circular series
  _getLegendDefaultSeries(data) {
    var chartData = data;

    return [
      PieSeries(
          dataSource: chartData,
          xValueMapper: (ChartSampleData data, _) => data.x as String,
          yValueMapper: (ChartSampleData data, _) => data.y,
          dataLabelMapper: (ChartSampleData data, _) => data.x as String,
          enableSmartLabels: true,
          dataLabelSettings: DataLabelSettings(
              isVisible: true,
              showZeroValue: true,
              labelPosition: ChartDataLabelPosition.outside,
              connectorLineSettings:
                  ConnectorLineSettings(type: ConnectorType.line)))
    ];
  }
}
