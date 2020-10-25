import 'package:educap/components/charts/column_chart.dart';
import 'package:educap/components/charts/line_chart.dart';
import 'package:educap/models/course.dart';
import 'package:educap/pages/analisy_enade/analyze_enade_controller.dart';
import 'package:educap/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AnalyzeEnadeScreen extends StatefulWidget {
  _AnalyzeEnadeScreen createState() => _AnalyzeEnadeScreen();
}

class _AnalyzeEnadeScreen extends State<AnalyzeEnadeScreen> {
  final _analyzeEnadeController = Modular.get<AnalyzeEnadeController>();

  @override
  void initState() {
    this._analyzeEnadeController.courseSelected = Course.lazy(0, "0", 0, 0);
    this._analyzeEnadeController.searchCoursesFromUniversity();
    this._analyzeEnadeController.searchCustomAnswers();
    this._analyzeEnadeController.searchDataEnadeFromUniversity();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Análise',
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => _analyzeEnadeController.showPage('/analysis'),
          ),
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView(children: <Widget>[
              Column(children: [
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Text(
                    Constants.university.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
                Observer(
                    builder: (_) => _analyzeEnadeController.loadingDataEnade ||
                            _analyzeEnadeController.loadingCourses
                        ? Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.8,
                            child: Center(
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.black12,
                                valueColor: new AlwaysStoppedAnimation<Color>(
                                    Colors.indigo),
                              ),
                            ),
                          )
                        : Container(
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 20, bottom: 10),
                                  child: Text(
                                    'Quantidade de alunos que realizaram o Enade anualmente',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black45, fontSize: 16),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 5, left: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      DropdownButton<Course>(
                                        value: _analyzeEnadeController
                                            .courseSelected,
                                        icon: Icon(Icons.arrow_drop_down),
                                        iconSize: 18,
                                        elevation: 6,
                                        style: TextStyle(color: Colors.black45),
                                        underline: Container(
                                            height: 2,
                                            color: Colors.transparent),
                                        onChanged: (Course course) {
                                          setState(() {
                                            _analyzeEnadeController
                                                .setCourseSelected(course);
                                          });
                                        },
                                        items: _analyzeEnadeController
                                            .getItensDropdownMenu(),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 20, top: 20, right: 20, bottom: 40),
                                  width: MediaQuery.of(context).size.width,
                                  height: 500,
                                  child: ColumnChart(
                                      _analyzeEnadeController.listEnades),
                                )
                              ],
                            ),
                          )),
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Text(
                    "PERCEPÇÃO DO ALUNO EM RELAÇÃO AO CURSO",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
                Observer(
                    builder: (_) => _analyzeEnadeController.loadingCustomAnswers
                        ? Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.8,
                            child: Center(
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.black12,
                                valueColor: new AlwaysStoppedAnimation<Color>(
                                    Colors.indigo),
                              ),
                            ),
                          )
                        : Container(
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Text(
                                    'O gráfico abaixo apresenta o percentual de concordância do aluno em relação as afirmações acerca da qualidade do curso, de uma forma geral.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black45, fontSize: 16),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 700,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 20,
                                        left: 5,
                                        right: 20,
                                        bottom: 20),
                                    child: LineChart(
                                        _analyzeEnadeController.seriesList),
                                  ),
                                )
                              ],
                            ),
                          ))
              ])
            ])));
  }
}
