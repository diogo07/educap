import 'package:educap/models/custom_answer.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class DataLineChartFormat {
  List<CustomAnswer> list;
  List<LinearSales> sales = List<LinearSales>();
  List<charts.Series<LinearSales, int>> series =
      List<charts.Series<LinearSales, int>>();

  DataLineChartFormat(List<CustomAnswer> list) {
    this.list = list;
  }

  List<charts.Series<LinearSales, int>> createSeries() {
    var list_nan = List<LinearSales>();
    var list_1 = List<LinearSales>();
    var list_2 = List<LinearSales>();
    var list_3 = List<LinearSales>();
    var list_4 = List<LinearSales>();
    var list_5 = List<LinearSales>();
    var list_6 = List<LinearSales>();
    var list_7 = List<LinearSales>();
    var list_8 = List<LinearSales>();

    for (var i = 0; i < this.list.length; i++) {
      for (var j = 0; j < this.list[i].data.length; j++) {
        if (this.list[i].data[j].option == 'NaN') {
          list_nan.add(LinearSales(
              this.list[i].year,
              (((this.list[i].data[j].amount) / getAllAmount(this.list[i])) *
                      100)
                  .round()));
        }

        if (this.list[i].data[j].option == '1.0') {
          list_1.add(LinearSales(
              this.list[i].year,
              (((this.list[i].data[j].amount) / getAllAmount(this.list[i])) *
                      100)
                  .round()));
        }

        if (this.list[i].data[j].option == '2.0') {
          list_2.add(LinearSales(
              this.list[i].year,
              (((this.list[i].data[j].amount) / getAllAmount(this.list[i])) *
                      100)
                  .round()));
        }

        if (this.list[i].data[j].option == '3.0') {
          list_3.add(LinearSales(
              this.list[i].year,
              (((this.list[i].data[j].amount) / getAllAmount(this.list[i])) *
                      100)
                  .round()));
        }

        if (this.list[i].data[j].option == '4.0') {
          list_4.add(LinearSales(
              this.list[i].year,
              (((this.list[i].data[j].amount) / getAllAmount(this.list[i])) *
                      100)
                  .round()));
        }

        if (this.list[i].data[j].option == '5.0') {
          list_5.add(LinearSales(
              this.list[i].year,
              (((this.list[i].data[j].amount) / getAllAmount(this.list[i])) *
                      100)
                  .round()));
        }

        if (this.list[i].data[j].option == '6.0') {
          list_6.add(LinearSales(
              this.list[i].year,
              (((this.list[i].data[j].amount) / getAllAmount(this.list[i])) *
                      100)
                  .round()));
        }

        if (this.list[i].data[j].option == '7.0') {
          list_7.add(LinearSales(
              this.list[i].year,
              (((this.list[i].data[j].amount) / getAllAmount(this.list[i])) *
                      100)
                  .round()));
        }

        if (this.list[i].data[j].option == '8.0') {
          list_8.add(LinearSales(
              this.list[i].year,
              (((this.list[i].data[j].amount) / getAllAmount(this.list[i])) *
                      100)
                  .round()));
        }
      }
    }

    this.series.add(new charts.Series<LinearSales, int>(
          id: 'Não Respondido',
          colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
          domainFn: (LinearSales sales, _) => sales.year,
          measureFn: (LinearSales sales, _) => sales.sales,
          data: list_nan,
        ));

    this.series.add(new charts.Series<LinearSales, int>(
          id: 'Discordo totalmente',
          colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
          domainFn: (LinearSales sales, _) => sales.year,
          measureFn: (LinearSales sales, _) => sales.sales,
          data: list_1,
        ));

    this.series.add(new charts.Series<LinearSales, int>(
          id: 'Discordo',
          colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
          domainFn: (LinearSales sales, _) => sales.year,
          measureFn: (LinearSales sales, _) => sales.sales,
          data: list_2,
        ));

    this.series.add(new charts.Series<LinearSales, int>(
          id: 'Discordo parcialmente',
          colorFn: (_, __) => charts.MaterialPalette.yellow.shadeDefault,
          domainFn: (LinearSales sales, _) => sales.year,
          measureFn: (LinearSales sales, _) => sales.sales,
          data: list_3,
        ));

    this.series.add(new charts.Series<LinearSales, int>(
          id: 'Concordo parcialmente',
          colorFn: (_, __) => charts.MaterialPalette.cyan.shadeDefault,
          domainFn: (LinearSales sales, _) => sales.year,
          measureFn: (LinearSales sales, _) => sales.sales,
          data: list_4,
        ));
    this.series.add(new charts.Series<LinearSales, int>(
          id: 'Concordo',
          colorFn: (_, __) => charts.MaterialPalette.gray.shadeDefault,
          domainFn: (LinearSales sales, _) => sales.year,
          measureFn: (LinearSales sales, _) => sales.sales,
          data: list_5,
        ));

    this.series.add(new charts.Series<LinearSales, int>(
          id: 'Concordo totalmente',
          colorFn: (_, __) => charts.MaterialPalette.teal.shadeDefault,
          domainFn: (LinearSales sales, _) => sales.year,
          measureFn: (LinearSales sales, _) => sales.sales,
          data: list_6,
        ));

    this.series.add(new charts.Series<LinearSales, int>(
          id: 'Não se aplica',
          colorFn: (_, __) => charts.MaterialPalette.indigo.shadeDefault,
          domainFn: (LinearSales sales, _) => sales.year,
          measureFn: (LinearSales sales, _) => sales.sales,
          data: list_7,
        ));

    this.series.add(new charts.Series<LinearSales, int>(
          id: 'Não sei responder',
          colorFn: (_, __) => charts.MaterialPalette.lime.shadeDefault,
          domainFn: (LinearSales sales, _) => sales.year,
          measureFn: (LinearSales sales, _) => sales.sales,
          data: list_8,
        ));

    return this.series;
  }

  int getAllAmount(CustomAnswer customAnswer) {
    var total = 0;
    customAnswer.data.forEach((element) {
      total += element.amount;
    });

    return total;
  }
}

class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
