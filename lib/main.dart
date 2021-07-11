import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '.themes.dart';
import 'pageHome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return themeHandler(context);
  }
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  final PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu),
          title: Text("Die Fünf Fritzen"),
          actions: [Icon(Icons.person), SizedBox(height: 5, width: 15)],
          elevation: 0,
          centerTitle: true,
        ),
        body: Home(),
      ),
    );
  }
}
