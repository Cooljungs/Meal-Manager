import 'package:flutter/material.dart';
import 'package:meal_manager/widgets/group_widgets/chat.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:meal_manager/widgets/group_widgets/week_preview.dart';
import 'package:meal_manager/widgets/group_widgets/history.dart';
import 'package:meal_manager/widgets/group_widgets/members.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool chatStatus = false;

  initChatStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _chatStatus = (prefs.getBool('chatStatus') ?? false);
    setState(() => chatStatus = _chatStatus);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initChatStatus();
  }

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
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: Text("Mitglieder",
                style: Theme.of(context).textTheme.headline2)),
        MemberList(),
        chatStatus
            ? Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child:
                    Text("Chat", style: Theme.of(context).textTheme.headline2))
            : Container(),
        chatStatus ? Chat() : Container(),
        SizedBox(
          height: 100,
        )
      ],
    );
  }
}
