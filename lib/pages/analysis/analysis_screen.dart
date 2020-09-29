import 'package:educap/pages/analysis/analysis_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class AnalysisScreen extends StatefulWidget {
  _AnalysisScreen createState() => _AnalysisScreen();
}

class _AnalysisScreen extends State<AnalysisScreen> {
  final _analysisController = Modular.get<AnalysisController>();

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Análises',
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => _analysisController.showPage('/home'),
        ),
      ),
      body: Scaffold(
          body: Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: StaggeredGridView.count(
                crossAxisCount: 4,
                staggeredTiles: _staggeredTiles,
                children: [
                  getTile(Colors.red[400], "Universidade", Icons.insert_chart,
                      '/analysis/university'),
                  getTile(
                      Colors.red[400], "Cidade", Icons.location_city, 'city'),
                ],
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
                padding: const EdgeInsets.all(4.0),
              ))),
    );
  }

  List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
    const StaggeredTile.count(2, 2),
    const StaggeredTile.count(2, 2),
  ];

  @override
  Widget getTile(Color color, String title, IconData icon, String route) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Card(
        color: color,
        child: InkWell(
          onTap: () {
            _analysisController.showPage(route);
          },
          child: new Center(
            child: Column(
              children: <Widget>[
                new Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: SizedBox(
                      height: 100,
                      child: new Icon(
                        icon,
                        color: Colors.white,
                        size: 50,
                      ),
                    )),
                SizedBox(
                  height: 50,
                  child: Text(
                    title,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
