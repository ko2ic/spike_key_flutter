import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UniqueKeySamplePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UniqueKeySamplePageState();
  }
}

class UniqueKeySamplePageState extends State<UniqueKeySamplePage> {
  List<Widget> tiles = [
    StatelessRandomTitle(),
    StatelessRandomTitle(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Unique Key Sample"),
      ),
      body: Column(children: tiles),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.sentiment_very_satisfied),
        onPressed: swapTiles,
      ),
    );
  }

  swapTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }
}

class StatelessRandomTitle extends StatelessWidget {
  final random = Random().nextInt(1000);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(random.toString()),
        ),
        Divider(),
      ],
    );
  }
}

class StatefulRandomTitle extends StatefulWidget {
  @override
  StatefulRandomTitleState createState() => StatefulRandomTitleState();
}

class StatefulRandomTitleState extends State<StatefulRandomTitle> {
  int random;

  @override
  void initState() {
    super.initState();
    random = Random().nextInt(1000);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(random.toString()),
        ),
        Divider(),
      ],
    );
  }
}
