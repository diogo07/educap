import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class LineChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  LineChart(this.seriesList, {this.animate});

  /// Creates a [LineChart] with sample data and no transition.
  factory LineChart.withSampleData() {
    return new LineChart(
      createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.LineChart(seriesList,
        domainAxis: new charts.NumericAxisSpec(
            viewport: new charts.NumericExtents(2014, 2017),
            renderSpec: charts.GridlineRendererSpec(
                labelStyle: charts.TextStyleSpec(fontSize: 12))),
        behaviors: [
          new charts.ChartTitle('Percentual',
              behaviorPosition: charts.BehaviorPosition.start,
              titleStyleSpec: charts.TextStyleSpec(fontSize: 10),
              titleOutsideJustification: charts.OutsideJustification.middle),
          new charts.PanAndZoomBehavior(),
          new charts.SeriesLegend(
            position: charts.BehaviorPosition.bottom,
            horizontalFirst: false,
            cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
            showMeasures: true,
            measureFormatter: (num value) {
              return value == null ? '-' : '${value}%';
            },
          ),
        ],
        selectionModels: [
          charts.SelectionModelConfig(
              changedListener: (charts.SelectionModel model) {
            if (model.hasDatumSelection) {
              var year = model.selectedSeries[0]
                  .domainFn(model.selectedDatum[0].index);
              Toast.show("Dados do ano de ${year}", context,
                  duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
            }
          })
        ],
        animate: animate);
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, int>> createSampleData() {
    final myFakeDesktopData = [
      new LinearSales(0, 5),
      new LinearSales(1, 25),
      new LinearSales(2, 100),
      new LinearSales(3, 75),
    ];

    var myFakeTabletData = [
      new LinearSales(0, 10),
      new LinearSales(1, 50),
      new LinearSales(2, 200),
      new LinearSales(3, 150),
    ];

    var myFakeMobileData = [
      new LinearSales(0, 15),
      new LinearSales(1, 75),
      new LinearSales(2, 300),
      new LinearSales(3, 225),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Desktop',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: myFakeDesktopData,
      ),
      new charts.Series<LinearSales, int>(
        id: 'Tablet',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: myFakeTabletData,
      ),
      new charts.Series<LinearSales, int>(
        id: 'Mobile',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: myFakeMobileData,
      ),
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
