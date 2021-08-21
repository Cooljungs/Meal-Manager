import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:meal_manager/screens/sub_screens/settings.dart';
import 'package:meal_manager/utils/.utilities.dart';
import 'package:meal_manager/utils/teleport.dart';
import 'package:meal_manager/utils/providers.dart';

class ScaffoldDrawer extends StatefulWidget {
  const ScaffoldDrawer({Key? key}) : super(key: key);

  @override
  _ScaffoldDrawerState createState() => _ScaffoldDrawerState();
}

class _ScaffoldDrawerState extends State<ScaffoldDrawer> {
  /// TODO: Gruppen-Namen zum Testen. Später dann aus Datenbank
  List groups = ["Die Fünf Fritzen", "Leipziger Banausen"];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).accentColor),
              child: Container(
                width: double.infinity,
                child: Text("Banner \nmit Logo",
                    style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSecondary)),
              )),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              physics: BouncingScrollPhysics(),
              itemCount: groups.length + 1,
              itemBuilder: (context, index) {
                return index < groups.length
                    ? ListTile(
                        leading: Icon(Icons.group_rounded,
                            color: Theme.of(context).colorScheme.onPrimary),
                        title: Text(groups[index]),
                        tileColor: groups[index] ==
                                Provider.of<GroupProvider>(context)
                                    .selectedGroup
                            ? Theme.of(context).disabledColor
                            : Colors.transparent,
                        onTap: () {
                          Navigator.pop(context);
                          printHint("'${groups[index]}' ausgewählt");
                          Provider.of<GroupProvider>(context, listen: false)
                              .setGroup(groups[index]);
                        })
                    : ListTile(
                        leading: Icon(Icons.add_rounded,
                            color: Theme.of(context).accentColor),
                        title: Text("Gruppe hinzufügen"),
                        onTap: () => showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Was tun?",
                                style: Theme.of(context).textTheme.headline3),
                            content: Text(
                                "Möchtest du einer Gruppe beitreten oder eine neue erstellen?"),
                            actions: [
                              TextButton(
                                  onPressed: () {}, child: Text("Beitreten")),
                              TextButton(
                                  onPressed: () {},
                                  child: Text("Neu erstellen"))
                            ],
                          ),
                        ),
                      );
              },
            ),
          ),
          Divider(),
          ListTile(
              leading: Icon(Icons.settings_rounded,
                  color: Theme.of(context).colorScheme.onPrimary),
              title: Text("Einstellungen"),
              onTap: () => Navigator.push(context,
                  Teleport(child: Settings(), type: "scale_bottomLeft"))),
        ],
      ),
    );
  }
}
