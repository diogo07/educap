import 'package:charts_flutter/flutter.dart' as charts;
import 'package:educap/models/enade.dart';
import 'package:educap/pages/analysis/analysis_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ColumnChart extends StatelessWidget {
  List<charts.Series> seriesList;
  bool animate = true;

  ColumnChart(List<Enade> list) {
    this.seriesList = _createSampleData(list);
  }

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(seriesList, animate: animate, selectionModels: [
      charts.SelectionModelConfig(
          changedListener: (charts.SelectionModel model) {
        if (model.hasDatumSelection) {
          int year = int.parse(
              model.selectedSeries[0].domainFn(model.selectedDatum[0].index));
          Modular.get<AnalysisController>()
              .routeToQuestions("/analysis/university/questions", year);
        }
      })
    ]);
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
