import 'package:flutter/material.dart';

class Fridge extends StatefulWidget {
  @override
  _FridgeState createState() => _FridgeState();
}

class _FridgeState extends State<Fridge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Kühlschrank"),
      ),
    );
  }
}
