import 'package:educap/app/app_controller.dart';
import 'package:educap/components/app_bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  final _homeController = Modular.get<HomeController>();
  final _appController = Modular.get<AppController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getAppBar('Início'),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(_appController.getUser().first_name,
                  style: TextStyle(color: Colors.white)),
              accountEmail: Text(_appController.getUser().username,
                  style: TextStyle(color: Colors.white)),
            ),
            ListTile(
                leading: Icon(
                  Icons.account_circle,
                  color: Colors.black38,
                ),
                title: Text('Perfil',
                    style: TextStyle(
                        color: Colors.black45, fontWeight: FontWeight.normal)),
                onTap: () {
                  _homeController.showPage('/profile');
                }),
            ListTile(
                title: Text('Configurações',
                    style: TextStyle(
                        color: Colors.black45, fontWeight: FontWeight.normal)),
                leading: Icon(Icons.settings, color: Colors.black38),
                onTap: () {
                  _homeController.showPage('/settings');
                }),
            ListTile(
              title: Text('Sair',
                  style: TextStyle(
                      color: Colors.black45, fontWeight: FontWeight.normal)),
              leading: Icon(Icons.exit_to_app, color: Colors.black38),
              onTap: () => _homeController.logout(),
            )
          ],
        ),
      ),
      body: Scaffold(
          body: Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: StaggeredGridView.count(
                crossAxisCount: 4,
                staggeredTiles: _staggeredTiles,
                children: [
                  getTile(Colors.red[400], "Análises", Icons.insert_chart,
                      'analysis'),
                  getTile(Colors.red[400], "Sobre", Icons.help, 'about'),
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
            _homeController.showPage(route);
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
