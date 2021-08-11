import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:meal_manager/constants/icon_classes.dart';
import 'package:meal_manager/core/auth/auth_service.dart';
import 'package:meal_manager/core/login/sign_up.dart';

// TODO: Passwort vergessen?

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String email = "";
  String password = "";

  String status = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Text("Anmelden", style: Theme.of(context).textTheme.headline2),
        ),
        centerTitle: true,
        toolbarHeight: 200,
        elevation: 0,
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.only(left: 56, right: 56),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            Row(
              children: [
                Expanded(
                    child: Container(
                        margin: EdgeInsets.only(right: 8, bottom: 16),
                        height: 72,
                        width: double.infinity,
                        child: ClipRRect(
                            clipBehavior: Clip.hardEdge,
                            borderRadius: BorderRadius.circular(16),
                            child: Stack(children: [
                              Container(color: Theme.of(context).cardColor),
                              Positioned.fill(
                                  child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        child: Center(
                                            child: Icon(CustomIcons.google)),
                                        onTap: () {},
                                      )))
                            ])))),
                Expanded(
                    child: Container(
                        margin: EdgeInsets.only(right: 8, bottom: 16),
                        height: 72,
                        width: double.infinity,
                        child: ClipRRect(
                            clipBehavior: Clip.hardEdge,
                            borderRadius: BorderRadius.circular(16),
                            child: Stack(children: [
                              Container(color: Theme.of(context).cardColor),
                              Positioned.fill(
                                  child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        child: Center(
                                            child: Icon(CustomIcons.apple)),
                                        onTap: () {},
                                      )))
                            ])))),
              ],
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: "mail@super-hungrig.de",
                labelText: "Email",
              ),
              onChanged: (value) => setState(() {
                status = "";
                email = value;
              }),
            ),
            SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Yummy1337",
                labelText: "Passwort",
              ),
              onChanged: (value) => setState(() {
                status = "";
                password = value;
              }),
            ),
            SizedBox(height: 16),
            Text(context.read<AuthenticationService>().errorHandling(status),
                style: TextStyle(color: Theme.of(context).errorColor)),
            TextButton(
                onPressed: () {
                  context
                      .read<AuthenticationService>()
                      .signIn(email, password)
                      .then((value) => setState(() => status = value));
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  child: Text("Bestätigen"),
                )),
            SizedBox(height: 16),
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.transparent),
              child: RichText(
                text: TextSpan(
                    text: "Noch keinen Account? ",
                    style: Theme.of(context).textTheme.bodyText2,
                    children: [
                      TextSpan(
                          text: " Registrieren",
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.bold))
                    ]),
              ),
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SignUp())),
            )
          ],
        ),
      )),
    );
  }
}
