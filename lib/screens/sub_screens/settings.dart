import 'package:flutter/material.dart';
import 'package:meal_manager/utils/providers.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:meal_manager/utils/.utilities.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool chatStatus = false;

  initChatStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _chatStatus = (prefs.getBool('chatStatus') ?? false);
    setState(() => chatStatus = _chatStatus);
  }

  changeChatStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _chatStatus = !(prefs.getBool('chatStatus') ?? false);
    await prefs.setBool('chatStatus', _chatStatus);
    setState(() => chatStatus = _chatStatus);
    printHint("chatStatus: $chatStatus");
  }

  @override
  void initState() {
    super.initState();
    initChatStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Einstellungen")),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text("Chat einblenden"),
            subtitle: Text("Viel zu hoher Online-Traffic"),
            value: chatStatus,
            onChanged: (value) => changeChatStatus(),
          ),
          ListTile()
        ],
      ),
    );
  }
}
