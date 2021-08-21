import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:meal_manager/screens/sub_screens/profile.dart';
import 'package:meal_manager/utils/teleport.dart';
import 'package:meal_manager/utils/avatars.dart';
import 'package:meal_manager/utils/providers.dart';

class ScaffoldAppBar extends StatefulWidget implements PreferredSizeWidget {
  const ScaffoldAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  _ScaffoldAppBarState createState() => _ScaffoldAppBarState();
}

class _ScaffoldAppBarState extends State<ScaffoldAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(

          /// Builder erzeugt IconButton, der den Drawer öffnet
          builder: (context) => IconButton(
              icon: Icon(Icons.menu_rounded, size: 32),
              onPressed: () => Scaffold.of(context).openDrawer())),

      /// Title-Text von Provider "GroupProvider" [provider.dart]
      title: Text(Provider.of<GroupProvider>(context).selectedGroup),
      actions: [
        Container(
          padding: const EdgeInsets.fromLTRB(0, 10, 16, 10),
          child: InkWell(
              borderRadius: BorderRadius.circular(999),
              child: Avatar(6, 36),
              onTap: () => Navigator.push(
                  context, Teleport(child: Profile(), type: "scale_topRight"))),
        ),
      ],
    );
  }
}
