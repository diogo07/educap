import 'package:educap/components/charts/column_chart.dart';
import 'package:educap/components/charts/grouped_chart.dart';
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
    this._analyzeEnadeController.searchDataEnadeFromUniversity();
    this._analyzeEnadeController.searchCoursesFromUniversity();
    // this._analyzeEnadeController.searchCustomAnswers();
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
            height: MediaQuery.of(context).size.height * 0.9,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: ListView(shrinkWrap: true, children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: Column(children: [
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
                        builder: (_) => _analyzeEnadeController
                                    .loadingDataEnade ||
                                _analyzeEnadeController.loadingCourses
                            ? Expanded(
                                child: Center(
                                  child: CircularProgressIndicator(
                                    backgroundColor: Colors.black12,
                                    valueColor:
                                        new AlwaysStoppedAnimation<Color>(
                                            Colors.indigo),
                                  ),
                                ),
                              )
                            : Column(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 20, bottom: 10),
                                    child: Text(
                                      'Quantidade de alunos que realizaram o Enade',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black45, fontSize: 16),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        DropdownButton<Course>(
                                          value: _analyzeEnadeController
                                              .courseSelected,
                                          icon: Icon(Icons.arrow_drop_down),
                                          iconSize: 18,
                                          elevation: 6,
                                          style:
                                              TextStyle(color: Colors.black45),
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
                                    width: MediaQuery.of(context).size.width,
                                    height: 400,
                                    child: ColumnChart(
                                        _analyzeEnadeController.listEnades),
                                  )
                                ],
                              )),
                  ]),
                ),
                // Container(
                //     width: MediaQuery.of(context).size.width,
                //     height: 400,
                //     child: Observer(
                //       builder: (_) => _analyzeEnadeController
                //               .loadingCustomAnswers
                //           ? Expanded(
                //               child: Center(
                //                 child: CircularProgressIndicator(
                //                   backgroundColor: Colors.black12,
                //                   valueColor: new AlwaysStoppedAnimation<Color>(
                //                       Colors.indigo),
                //                 ),
                //               ),
                //             )
                //           : GroupedBarChart(
                //               _analyzeEnadeController.listCustomAnswers),
                //     ))
              ]),
            )));
  }
}
