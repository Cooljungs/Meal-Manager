import 'package:flutter/material.dart';
import 'package:meal_manager/pages/_settings.dart';
import 'package:provider/provider.dart';
import 'package:meal_manager/fire.dart';
import '../main.dart';
import '/presentation/custom_icons_icons.dart';

import '_signIn.dart';

class SignUpVerify extends StatefulWidget {
  const SignUpVerify({Key? key}) : super(key: key);

  @override
  _SignUpVerifyState createState() => _SignUpVerifyState();
}

class _SignUpVerifyState extends State<SignUpVerify> {
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
            SizedBox(height: 16),
            TextField(
              cursorColor: Theme.of(context).focusColor,
              decoration: InputDecoration(
                hintText: "B8WTC6",
                labelText: "Code eingeben",
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
                      ? Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Main()))
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
                    text: "Code nicht erhalten? ",
                    style: Theme.of(context).textTheme.bodyText2,
                    children: [
                      TextSpan(
                          text: " Erneut senden",
                          style: TextStyle(
                              color: Theme.of(context).focusColor,
                              fontWeight: FontWeight.bold))
                    ]),
              ),
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SignIn())),
            )
          ],
        ),
      )),
    );
  }
}
