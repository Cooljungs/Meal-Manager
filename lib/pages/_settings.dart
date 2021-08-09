import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Einstellungen"), elevation: 0),
      body: Material(
        child: InkWell(
          onTap: () => print("Settings Clicked"),
          child: Ink(
            color: Colors.green,
            child: Container(),
          ),
        ),
      ),
    );
  }
}
