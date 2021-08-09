import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:meal_manager/fire.dart';

// TODO: Passwort vergessen?
// TODO: Registrierung

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            TextField(
              cursorColor: Theme.of(context).focusColor,
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
              cursorColor: Theme.of(context).focusColor,
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
            SizedBox(height: 56),
            TextButton(
                onPressed: () {
                  context
                      .read<AuthenticationService>()
                      .signIn(email, password)
                      .then((value) => setState(() => status = value));
                },
                child: Text("Enter")),
          ],
        ),
      )),
    );
  }
}
