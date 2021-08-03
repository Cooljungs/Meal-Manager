import 'package:flutter/material.dart';

import '../components/home_WeekPreview.dart';
import '../components/home_History.dart';
import '../components/home_Chat.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Text("Wochenplan",
                style: Theme.of(context).textTheme.headline2)),
        WeekPreview(),
        Padding(
            padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
            child: Text("Letzte Mahlzeiten",
                style: Theme.of(context).textTheme.headline2)),
        History(),
        Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Text("Chat", style: Theme.of(context).textTheme.headline2)),
        Chat()
      ],
    );
  }
}
