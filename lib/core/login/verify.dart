import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meal_manager/utils/teleport.dart';
import 'package:provider/provider.dart';

import 'package:meal_manager/main.dart';
import 'package:meal_manager/core/auth/auth_service.dart';
import 'package:meal_manager/core/login/sign_in.dart';

class Verify extends StatefulWidget {
  const Verify({Key? key}) : super(key: key);

  @override
  _VerifyState createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  String email = "";
  String password = "";
  String password2 = "";

  String status = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 200,
        title: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Text("Email verifizieren",
              style: Theme.of(context).textTheme.headline2),
        ),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.only(left: 56, right: 56),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            Icon(Icons.forward_to_inbox_rounded, size: 128),
            SizedBox(height: 16),
            Text(
                "Bitte klicken Sie auf den Bestätigungslink, den wir Ihnen per E-Mail haben zukommen lassen. Vielen Dank."),
            SizedBox(height: 32),
            TextButton(
              child: Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                child: Text("Aktualisieren"),
              ),
              onPressed: () => Navigator.pushReplacement(
                  context, Teleport(child: UserCheck())),
            ),
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.transparent),
              child: RichText(
                text: TextSpan(
                    text: "Anderes Konto verwenden? ",
                    style: Theme.of(context).textTheme.bodyText2,
                    children: [
                      TextSpan(
                          text: " Anmelden",
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.bold))
                    ]),
              ),
              onPressed: () {
                Provider.of<AuthenticationService>(context, listen: false)
                    .signOut();
                Navigator.pushReplacement(context, Teleport(child: SignIn()));
              },
            )
          ],
        ),
      )),
    );
  }
}
