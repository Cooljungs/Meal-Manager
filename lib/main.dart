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
          elevation: 0,
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBar(
              title: Text("Home"),
              elevation: 0,
              centerTitle: true,
            ),
          ),
        ),
        body: Home(),
      ),
    );
  }
}
