import 'package:flutter/material.dart';
import 'package:meal_manager/presentation/app_icons.dart';
import '.themes.dart';
import 'pageShopping.dart';
import 'pageFridge.dart';
import 'pageRecipes.dart';
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

  List pageList = [Shopping(), Fridge(), Recipes(), Week(), Group()];
  int currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu),
          title: Text("Die Fünf Fritzen"),
          actions: [Icon(Icons.person), SizedBox(height: 5, width: 15)],
          elevation: 0,
          centerTitle: false,
        ),
        body: pageList[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          selectedItemColor: Theme.of(context).focusColor,
          unselectedItemColor: Theme.of(context).accentColor,
          backgroundColor: Theme.of(context).primaryColor,
          showUnselectedLabels: false,
          showSelectedLabels: currentIndex == 2 ? false : false,
          onTap: (value) {
            setState(() => currentIndex = value);
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
              icon: Icon(
                AppIcons.recipes,
                size: 40,
              ),
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
