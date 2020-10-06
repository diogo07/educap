import 'package:charts_flutter/flutter.dart' as charts;
import 'package:educap/helpers/constants.dart';
import 'package:educap/models/answer.dart';
import 'package:flutter/material.dart';

class PieChart extends StatelessWidget {
  List<charts.Series> seriesList;
  bool animate = true;

  PieChart(List<Answer> list) {
    this.seriesList = _createSampleData(list);
  }

  @override
  Widget build(BuildContext context) {
    return new charts.PieChart(
      seriesList,
      animate: animate,
      animationDuration: Duration(seconds: 1),
      behaviors: [
        new charts.DatumLegend(
          position: charts.BehaviorPosition.end,
          horizontalFirst: false,
          entryTextStyle: charts.TextStyleSpec(
              fontSize: 12, color: charts.MaterialPalette.black),
          cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
          showMeasures: true,
          legendDefaultMeasure: charts.LegendDefaultMeasure.firstValue,
          // measureFormatter: (num value) {
          //   return value == null ? '-' : ' - $value';
          // },
        ),
      ],
    );
  }

  List<charts.Series<Answer, String>> _createSampleData(List<Answer> list) {
    return [
      new charts.Series<Answer, String>(
        id: 'Answer',
        colorFn: (Answer answer, _) =>
            charts.ColorUtil.fromDartColor(answer.color),
        domainFn: (Answer sales, _) => sales.option.toString(),
        measureFn: (Answer sales, _) => sales.amount,
        data: list,
      )
    ];
  }
}
