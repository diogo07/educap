import 'package:educap/models/university.dart';
import 'package:educap/pages/analysis/analysis_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UniversityAnalyzeSearchScreen extends StatefulWidget {
  _UniversityAnalyzeSearchScreen createState() =>
      _UniversityAnalyzeSearchScreen();
}

class _UniversityAnalyzeSearchScreen
    extends State<UniversityAnalyzeSearchScreen> {
  final _analysisController = Modular.get<AnalysisController>();

  @override
  void initState() {
    this._analysisController.listUniversities = List<University>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Buscar Universidade',
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => _analysisController.showPage('/home'),
        ),
      ),
      body: Scaffold(
          body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 25),
                    child: Text(
                        'Pesquise e selecione a universidade que você deseja visualizar os dados do Enade',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black87)),
                  ),
                  TextField(
                    onChanged: _analysisController.setFilterUniversity,
                    decoration: InputDecoration(
                      labelText: 'Digite o nome da universidade',
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.black38,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.indigo,
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.indigo,
                          )),
                    ),
                  ),
                  Observer(
                    builder: (_) => _analysisController.loadingSearchUniversity
                        ? Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    margin: EdgeInsets.only(bottom: 10.0),
                                    child: Text(
                                      'Pesquisando',
                                      style: TextStyle(color: Colors.black38),
                                    )),
                                Container(
                                  margin: EdgeInsets.only(bottom: 40.0),
                                  child: CircularProgressIndicator(
                                    backgroundColor: Colors.black26,
                                    valueColor:
                                        new AlwaysStoppedAnimation<Color>(
                                            Colors.indigo),
                                  ),
                                )
                              ],
                            ),
                          )
                        : Container(),
                  ),
                  Observer(
                    builder: (_) => _analysisController.loadingSearchUniversity
                        ? Container()
                        : Expanded(
                            child: ListView.separated(
                              itemCount:
                                  _analysisController.listUniversities.length,
                              itemBuilder: (BuildContext context, int index) {
                                return buildRow(_analysisController
                                    .listUniversities[index]);
                              },
                              separatorBuilder: (context, index) {
                                return Divider();
                              },
                            ),
                          ),
                  ),
                ],
              ))),
    );
  }

  Widget buildRow(University university) {
    return ListTile(
      leading: Container(
        child: Icon(
          Icons.location_city,
          color: Colors.black45,
          size: 25,
        ),
      ),
      title: Text(university.name,
          style: TextStyle(color: Colors.black45, fontSize: 14.0)),
      subtitle: Row(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Text('${university.city.name} - ${university.city.uf}',
                    style: TextStyle(color: Colors.black54, fontSize: 14.0))),
          )
        ],
      ),
      trailing:
          Icon(Icons.keyboard_arrow_right, color: Colors.black54, size: 25.0),
      onTap: () => _analysisController.routeToUniversity(
          '/analysis/university', university),
    );
  }
}
