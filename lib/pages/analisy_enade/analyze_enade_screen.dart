import 'package:educap/pages/analisy_enade/analyze_enade_controller.dart';
import 'package:educap/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AnalyzeEnadeScreen extends StatefulWidget {
  _AnalyzeEnadeScreen createState() => _AnalyzeEnadeScreen();
}

class _AnalyzeEnadeScreen extends State<AnalyzeEnadeScreen> {
  final _analyzeEnadeController = Modular.get<AnalyzeEnadeController>();

  @override
  void initState() {}

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
      body: Scaffold(
          body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(Constants.university.name),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (BuildContext context, int index) =>
                          EntryItem(data[index]),
                      itemCount: data.length,
                    ),
                  )
                ],
              ))),
    );
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
