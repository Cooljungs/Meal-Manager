import 'package:flutter/material.dart';
import 'package:meal_manager/pages/_signIn.dart';
import 'package:provider/provider.dart';
import 'package:meal_manager/fire.dart';

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
      body: Center(
          child: TextButton(
        child: Text("Abmelden"),
        onPressed: () {
          context.read<AuthenticationService>().signOut();
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => SignIn()));
        },
      )),
    );
  }
}
