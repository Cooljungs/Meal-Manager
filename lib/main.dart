import 'package:flutter/material.dart';
import '.themes.dart';
import 'pageShopping.dart';
import 'pageFridge.dart';
import 'pageHome.dart';
import 'pageWeek.dart';
import 'pageGroup.dart';

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

  List pageList = [Shopping(), Fridge(), Home(), Week(), Group()];
  int current_index = 2;

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
        body: pageList[current_index],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: current_index,
          elevation: 0,
          selectedItemColor: Theme.of(context).highlightColor,
          unselectedItemColor: Theme.of(context).accentColor,
          backgroundColor: Colors.green,
          showUnselectedLabels: false,
          onTap: (value) {
            setState(() => current_index = value);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_rounded),
              label: "Einkauf",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.kitchen_rounded),
              label: "Kühlschrank",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_rounded),
              label: "Rezepte",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.event_rounded),
              label: "Wochenplan",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.group_rounded),
              label: "Haushalt",
            ),
          ],
        ),
        /*
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          child: Icon(Icons.restaurant_rounded),
          onPressed: () {},
        ),
        */
      ),
    );
  }
}
