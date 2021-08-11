import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:meal_manager/constants/icon_classes.dart';
import 'package:meal_manager/core/auth/auth_service.dart';
import 'package:meal_manager/core/login/verify.dart';

// TODO: Passwort vergessen?
// TODO: Registrierung

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email = "";
  String password = "";
  String password2 = "";

  String status = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Text("Registrieren",
              style: Theme.of(context).textTheme.headline2),
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
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Yummy1337",
                labelText: "Passwort wiederholen",
              ),
              onChanged: (value) => setState(() {
                status = "";
                password2 = value;
              }),
            ),
            SizedBox(height: 16),
            Center(
              child: Text(status != "success" ? status : "",
                  style: TextStyle(color: Theme.of(context).errorColor)),
            ),
            TextButton(
                onPressed: () async {
                  await context
                      .read<AuthenticationService>()
                      .signUp(email, password, password2)
                      .then((value) => setState(() => status = value));
                  status == "success"
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpVerify()))
                      : null;
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
                    text: "Bereits einen Account? ",
                    style: Theme.of(context).textTheme.bodyText2,
                    children: [
                      TextSpan(
                          text: " Anmelden",
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.bold))
                    ]),
              ),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignUpVerify())),
            )
          ],
        ),
      )),
    );
  }
}
