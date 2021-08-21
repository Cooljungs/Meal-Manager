import 'package:flutter/material.dart';
import 'package:meal_manager/utils/avatars.dart';

class MemberList extends StatefulWidget {
  const MemberList({Key? key}) : super(key: key);

  @override
  _MemberListState createState() => _MemberListState();
}

class _MemberListState extends State<MemberList> {
//
  // TODO: Daten von Firebase
  String userName = "Papa";
  /*
  Map groupMembers = {
    "Mama": "Gruppenleiter:in",
    "Papa": "Gruppenleiter:in",
    "Christoph": "Mitglied",
    "Tim": "Mitglied",
    "Simon": "Mitglied"
  };
  */

  List<List> groupMembers = [
    ["Mama", "Gruppenleiter:in", 5],
    ["Papa", "Gruppenleiter:in", 6],
    ["Christoph", "Mitglied", 1],
    ["Tim", "Mitglied", 1],
    ["Simon", "Mitglied", 6]
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        groupMembers.length,
        (index) => Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: ListTile(
            tileColor: groupMembers[index][0] == userName
                ? Theme.of(context).disabledColor
                : Theme.of(context).cardColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            leading: Avatar(groupMembers[index][2], 36),
            title: Text(groupMembers[index][0]),
            subtitle: Text(groupMembers[index][1]),
            onTap: () => showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Avatar(groupMembers[index][2], 128),
                          Text(groupMembers[index][0] == userName
                              ? "Mein Profil"
                              : groupMembers[index][0])
                        ],
                      ),
                      content:
                          Text("Entfernen, Status, Freunde, Spitzname, ..."),
                    )),
          ),
        ),
      ),
    );
  }
}
