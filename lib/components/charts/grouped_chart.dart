import 'package:charts_flutter/flutter.dart' as charts;
import 'package:educap/models/custom_answer.dart';
import 'package:educap/models/enade.dart';
import 'package:educap/pages/analysis/analysis_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class GroupedChart extends StatelessWidget {
  List<charts.Series> seriesList;
  bool animate = true;

  GroupedChart(List<CustomAnswer> list) {
    this.seriesList = _createSampleData(list);
  }

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      animate: animate,
      selectionModels: [
        charts.SelectionModelConfig(
            changedListener: (charts.SelectionModel model) {
          if (model.hasDatumSelection) {
            int year = int.parse(
                model.selectedSeries[0].domainFn(model.selectedDatum[0].index));
            Modular.get<AnalysisController>()
                .routeToQuestions("/analysis/university/questions", year);
          }
        })
      ],
      barGroupingType: charts.BarGroupingType.grouped,
    );
  }

  List<charts.Series<CustomAnswer, String>> _createSampleData(
      List<CustomAnswer> list) {
    list.forEach((item) {
      item.data.forEach((element) {
        return [
          new charts.Series<CustomAnswer, String>(
            id: 'Enade',
            colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
            domainFn: (__, _) => item.year.toString(),
            measureFn: (__, _) => element.amount,
            data: list,
          )
        ];
      });
    });
  }
}

class GroupedBarChart extends StatelessWidget {
  final List<charts.Series> seriesList = _createSampleData();
  final bool animate = true;

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      animate: animate,
      barGroupingType: charts.BarGroupingType.grouped,
    );
  }

  /// Create series list with multiple series
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final desktopSalesData = [
      new OrdinalSales('2014', 5),
      new OrdinalSales('2015', 25),
      new OrdinalSales('2016', 100),
      new OrdinalSales('2017', 75),
      new OrdinalSales('2018', 45),
    ];

    final tableSalesData = [
      new OrdinalSales('2014', 25),
      new OrdinalSales('2015', 50),
      new OrdinalSales('2016', 10),
      new OrdinalSales('2017', 20),
      new OrdinalSales('2018', 80),
    ];

    final mobileSalesData = [
      new OrdinalSales('2014', 10),
      new OrdinalSales('2015', 15),
      new OrdinalSales('2016', 50),
      new OrdinalSales('2017', 45),
      new OrdinalSales('2018', 75),
    ];

    final test1SalesData = [
      new OrdinalSales('2014', 10),
      new OrdinalSales('2015', 15),
      new OrdinalSales('2016', 50),
      new OrdinalSales('2017', 45),
      new OrdinalSales('2018', 75),
    ];

    final test2SalesData = [
      new OrdinalSales('2014', 10),
      new OrdinalSales('2015', 15),
      new OrdinalSales('2016', 50),
      new OrdinalSales('2017', 45),
      new OrdinalSales('2018', 75),
    ];

    final test3SalesData = [
      new OrdinalSales('2014', 10),
      new OrdinalSales('2015', 15),
      new OrdinalSales('2016', 50),
      new OrdinalSales('2017', 45),
      new OrdinalSales('2018', 75),
    ];

    final test4SalesData = [
      new OrdinalSales('2014', 10),
      new OrdinalSales('2015', 15),
      new OrdinalSales('2016', 50),
      new OrdinalSales('2017', 45),
      new OrdinalSales('2018', 75),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Desktop',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: desktopSalesData,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Tablet',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: tableSalesData,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Mobile',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: mobileSalesData,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Teste 1',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: test1SalesData,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Teste 2',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: test2SalesData,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Teste 3',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: test3SalesData,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Teste 4',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: test4SalesData,
      ),
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
