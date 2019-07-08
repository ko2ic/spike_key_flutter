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
//  List<Widget> titles = [
//    StatelessRandomTitle(),
//    StatelessRandomTitle(),
//  ];
  List<Widget> titles = [
    StatefulRandomTitle(),
    StatefulRandomTitle(),
  ];

//  List<Widget> titles = [
//    StatefulRandomTitle(key: UniqueKey()),
//    StatefulRandomTitle(key: UniqueKey()),
//  ];

//  List<Widget> titles = [
//    Padding(
//      key: UniqueKey(),
//      padding: const EdgeInsets.all(8.0),
//      child: StatefulRandomTitle(),
//    ),
//    Padding(
//      key: UniqueKey(),
//      padding: const EdgeInsets.all(8.0),
//      child: StatefulRandomTitle(),
//    ),
//  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Unique Key Sample"),
        ),
        body: Column(
          children: <Widget>[
            RaisedButton(child: Text("入れ替える"), onPressed: swapTitles),
            Column(children: titles),
          ],
        ));
  }

  swapTitles() {
    setState(() {
      titles.insert(1, titles.removeAt(0));
    });
  }
}

class StatefulRandomTitle extends StatefulWidget {
  StatefulRandomTitle({Key key}) : super(key: key);

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
    return ListTile(
      title: Text(random.toString()),
    );
  }
}

// statelessの場合は以下

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
