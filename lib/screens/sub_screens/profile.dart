import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:meal_manager/constants/asset_path.dart';
import 'package:meal_manager/core/auth/auth_service.dart';
import 'package:meal_manager/core/login/sign_in.dart';
import 'package:meal_manager/utils/avatars.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mein Profil"),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 10, 16, 10),
            child: InkWell(
                borderRadius: BorderRadius.circular(999),
                child: avatarPainter(context, 256),
                onTap: () {}),
          ),
          Center(
              child: TextButton(
            child: Text("Abmelden"),
            onPressed: () {
              Navigator.pop(context);
              context.read<AuthenticationService>().signOut();
            },
          )),
        ],
      ),
    );
  }
}
