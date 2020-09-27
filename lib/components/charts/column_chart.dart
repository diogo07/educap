import 'package:charts_flutter/flutter.dart' as charts;
import 'package:educap/models/enade.dart';
import 'package:flutter/material.dart';

class ColumnChart extends StatelessWidget {
  List<charts.Series> seriesList;
  bool animate = true;

  ColumnChart(List<Enade> list) {
    this.seriesList = _createSampleData(list);
  }

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      animate: animate,
    );
  }

  List<charts.Series<Enade, String>> _createSampleData(List<Enade> list) {
    return [
      new charts.Series<Enade, String>(
        id: 'Enade',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (Enade sales, _) => sales.year.toString(),
        measureFn: (Enade sales, _) => sales.sales,
        data: list,
      )
    ];
  }
}
