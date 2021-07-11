import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Text(
                "Wochenplan",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Text(
                "Chat",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
