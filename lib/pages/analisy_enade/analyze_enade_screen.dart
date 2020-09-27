import 'package:educap/components/charts/column_chart.dart';
import 'package:educap/pages/analisy_enade/analyze_enade_controller.dart';
import 'package:educap/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AnalyzeEnadeScreen extends StatefulWidget {
  _AnalyzeEnadeScreen createState() => _AnalyzeEnadeScreen();
}

class _AnalyzeEnadeScreen extends State<AnalyzeEnadeScreen> {
  final _analyzeEnadeController = Modular.get<AnalyzeEnadeController>();
  String dropdownValue = 'Todos os cursos';

  @override
  void initState() {
    super.initState();
    this._analyzeEnadeController.searchQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Análise',
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () =>
                _analyzeEnadeController.showPage('/analysis/university'),
          ),
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.9,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: ListView(shrinkWrap: true, children: <Widget>[
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
                      builder: (_) => _analyzeEnadeController
                              .loadingSearchQuestions
                          ? Expanded(
                              child: Center(
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.black12,
                                  valueColor: new AlwaysStoppedAnimation<Color>(
                                      Colors.indigo),
                                ),
                              ),
                            )
                          : Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 20, bottom: 20),
                                  child: Text(
                                    'Quantidade de alunos que realizaram o Enade por ano',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black45, fontSize: 14),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 20),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      DropdownButton<String>(
                                        value: dropdownValue,
                                        icon: Icon(Icons.arrow_drop_down,
                                            color: Colors.black26),
                                        iconSize: 24,
                                        elevation: 16,
                                        style: TextStyle(color: Colors.black38),
                                        underline: Container(
                                          height: 2,
                                          color: Colors.white,
                                        ),
                                        onChanged: (String newValue) {
                                          setState(() {
                                            dropdownValue = newValue;
                                          });
                                        },
                                        items: <String>[
                                          'Todos os cursos',
                                          'Sistemas de Informação',
                                          'Ciências Econômicas'
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
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
                            ))
                ])
              ]),
            )));
  }
}

class Entry {
  const Entry(this.title, [this.children = const <Entry>[]]);
  final String title;
  final List<Entry> children;
}

// Data to display.
const List<Entry> data = <Entry>[
  Entry(
    'Chapter A',
    <Entry>[
      Entry(
        'Section A0',
        <Entry>[
          Entry('Item A0.1'),
          Entry('Item A0.2'),
        ],
      ),
      Entry('Section A1'),
      Entry('Section A2'),
    ],
  ),
  Entry(
    'Chapter B',
    <Entry>[
      Entry('Section B0'),
      Entry('Section B1'),
    ],
  ),
];

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}
