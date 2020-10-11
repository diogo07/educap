import 'package:educap/components/charts/pie_chart.dart';
import 'package:educap/helpers/constants.dart';
import 'package:educap/models/question.dart';
import 'package:educap/pages/analisy_enade/analyze_enade_controller.dart';
import 'package:educap/pages/answer/answer_controller.dart';
import 'package:educap/pages/questions/questions_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class QuestionsEnadeScreen extends StatefulWidget {
  _QuestionsEnadeScreen createState() => _QuestionsEnadeScreen();
}

class _QuestionsEnadeScreen extends State<QuestionsEnadeScreen> {
  final _questionsController = Modular.get<QuestionsController>();
  final _analyzeEnadeController = Modular.get<AnalyzeEnadeController>();

  @override
  void initState() {
    this._questionsController.searchQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Questões',
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () =>
                _questionsController.showPage('/analysis/university'),
          ),
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.9,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: ListView(shrinkWrap: true, children: <Widget>[
                _analyzeEnadeController.courseSelected.id != 0
                    ? Text(
                        'ENADE DE ${Constants.yearAnalyze} DO CURSO DE ${Constants.getCourseByGroup(_analyzeEnadeController.courseSelected.group)} DA ${Constants.university.name}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )
                    : Text(
                        'ENADE DE ${Constants.yearAnalyze} DA ${Constants.university.name}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                Observer(
                    builder: (_) => _questionsController.loadingSearchQuestions
                        ? Expanded(
                            child: Center(
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.black26,
                                valueColor: new AlwaysStoppedAnimation<Color>(
                                    Colors.indigo),
                              ),
                            ),
                          )
                        : buildList())
              ]),
            )));
  }

  Widget buildList() {
    return Column(
        children: this
            ._questionsController
            .listQuestions
            .map((item) => Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: _buildQuestion(item)))
            .toList());
  }

  _buildQuestion(Question question) {
    return ExpansionTile(
      key: PageStorageKey<Question>(question),
      title: Text("${question.description}",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black54,
            fontSize: 16,
          )),
      children: [_buildChartAnswer(question)],
    );
  }

  _buildChartAnswer(Question question) {
    AnswerController answerController = AnswerController();
    answerController.searchAnswer(question);
    return Observer(
        builder: (_) => answerController.loadingSearchAnswers
            ? Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.black12,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.indigo),
                  ),
                ),
              )
            : Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: PieChart(answerController.listAnswers)));
  }
}
