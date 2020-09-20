import 'package:educap/models/university.dart';
import 'package:educap/pages/analysis/analysis_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class UniversityAnalyzeSearchScreen extends StatefulWidget {
  _UniversityAnalyzeSearchScreen createState() =>
      _UniversityAnalyzeSearchScreen();
}

class _UniversityAnalyzeSearchScreen
    extends State<UniversityAnalyzeSearchScreen> {
  final _analysisController = Modular.get<AnalysisController>();

  @override
  void initState() {}

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
          onPressed: () => _analysisController.showPage('/analysis'),
        ),
      ),
      body: Scaffold(
          body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextField(
                    onChanged: _analysisController.setFilterUniversity,
                    decoration: InputDecoration(
                      labelText: 'Digite o nome da universidade',
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.black12,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.greenAccent,
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.greenAccent,
                          )),
                    ),
                  ),
                  Observer(
                    builder: (_) => _analysisController.loadingSearchUniversity
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.only(bottom: 10.0),
                                  child: Text(
                                    'Pesquisando',
                                    style: TextStyle(color: Colors.black26),
                                  )),
                              Container(
                                margin: EdgeInsets.only(bottom: 40.0),
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.black12,
                                  valueColor: new AlwaysStoppedAnimation<Color>(
                                      Colors.greenAccent),
                                ),
                              )
                            ],
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
          color: Colors.black38,
          size: 25,
        ),
      ),
      title: Text(university.name,
          style: TextStyle(color: Colors.black38, fontSize: 11.0)),
      subtitle: Row(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Text(university.city.name,
                    style: TextStyle(color: Colors.black45, fontSize: 11.0))),
          )
        ],
      ),
      trailing:
          Icon(Icons.keyboard_arrow_right, color: Colors.black38, size: 25.0),
      onTap: () => _analysisController.showPage('/university/${university.id}'),
    );
  }
}
