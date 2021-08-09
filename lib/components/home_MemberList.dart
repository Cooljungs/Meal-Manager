import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MemberList extends StatefulWidget {
  const MemberList({Key? key}) : super(key: key);

  @override
  _MemberListState createState() => _MemberListState();
}

class _MemberListState extends State<MemberList> {
//
  // TODO: Daten von Firebase
  String userName = "Papa";
  Map groupMembers = {
    "Mama": "Gruppenleiter:in",
    "Papa": "Gruppenleiter:in",
    "Christoph": "Mitglied",
    "Tim": "Mitglied",
    "Simon": "Mitglied"
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        groupMembers.length,
        (index) => Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: ListTile(
            tileColor: groupMembers.keys.toList()[index] == userName
                ? Theme.of(context).disabledColor
                : Theme.of(context).cardColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            leading: SvgPicture.asset(
              "assets/images/avatars/v3/avatar_1.svg",
              width: 36,
              height: 36,
            ),
            title: Text(groupMembers.keys.toList()[index]),
            subtitle: Text(groupMembers.values.toList()[index]),
            onTap: () => showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            "assets/images/avatars/v3/avatar_1.svg",
                            width: 128,
                            height: 128,
                          ),
                          Text(groupMembers.keys.toList()[index])
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
