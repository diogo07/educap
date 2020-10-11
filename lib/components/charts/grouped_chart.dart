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
  List<charts.Series> seriesList;
  bool animate = true;

  GroupedBarChart(List<CustomAnswer> list) {
    this.seriesList = createListOrdinalSales(list);
  }

  createOrdinalSales(CustomAnswer item) {
    var listSales = [];
    item.data.forEach((element) {
      listSales.add(OrdinalSales(item.year.toString(), element.amount));
    });

    return listSales;
  }

  createListOrdinalSales(List<CustomAnswer> list) {
    var ordinalSales1 = createOrdinalSales(list[0]);
    final salesData1 = [
      ordinalSales1[0],
      ordinalSales1[1],
      ordinalSales1[2],
      ordinalSales1[3],
      ordinalSales1[4],
    ];

    var ordinalSales2 = createOrdinalSales(list[1]);
    final salesData2 = [
      ordinalSales2[0],
      ordinalSales2[1],
      ordinalSales2[2],
      ordinalSales2[3],
      ordinalSales2[4],
    ];

    var ordinalSales3 = createOrdinalSales(list[2]);
    final salesData3 = [
      ordinalSales3[0],
      ordinalSales3[1],
      ordinalSales3[2],
      ordinalSales3[3],
      ordinalSales3[4],
    ];

    var ordinalSales4 = createOrdinalSales(list[3]);
    final salesData4 = [
      ordinalSales4[0],
      ordinalSales4[1],
      ordinalSales4[2],
      ordinalSales4[3],
      ordinalSales4[4],
    ];

    var ordinalSales5 = createOrdinalSales(list[4]);
    final salesData5 = [
      ordinalSales5[0],
      ordinalSales5[1],
      ordinalSales5[2],
      ordinalSales5[3],
      ordinalSales5[4],
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: '2014',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: salesData1,
      ),
      new charts.Series<OrdinalSales, String>(
        id: '2015',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: salesData2,
      ),
      new charts.Series<OrdinalSales, String>(
        id: '2016',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: salesData3,
      ),
      new charts.Series<OrdinalSales, String>(
        id: '2017',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: salesData4,
      ),
      new charts.Series<OrdinalSales, String>(
        id: '2018',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: salesData5,
      ),
    ];
  }

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
