import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '.themes.dart';

import 'pages/shopping.dart';
import 'pages/fridge.dart';
import 'pages/recipes.dart';
import 'pages/week.dart';
import 'pages/home.dart';

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
  //
  final PageController controller = PageController(initialPage: 0);
  int currentIndex = 0; // Start-Index

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
                icon: Icon(Icons.menu_rounded, size: 32),
                onPressed: () => Scaffold.of(context).openDrawer()),
          ),
          title: Text("Die Fünf Fritzen"),
          actions: [
            Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 16, 10),
              child: InkWell(
                  borderRadius: BorderRadius.circular(999),
                  child: SvgPicture.asset(
                    "assets/images/avatars/v3/avatar_1.svg",
                    width: 36,
                    height: 36,
                  ),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              "Mein Profil",
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          );
                        });
                  }),
            ),
          ],
          elevation: 0,
          centerTitle: false,
        ),
        body: [Home(), Week(), Fridge(), Shopping()][currentIndex],
        drawer: Drawer(
            child: Column(
          children: [
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  DrawerHeader(
                      child: Text("Banner \nmit Logo",
                          style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).primaryColor)),
                      decoration:
                          BoxDecoration(color: Theme.of(context).focusColor)),
                  ListTile(
                      leading: Icon(Icons.group_rounded,
                          color: Theme.of(context).accentColor),
                      title: Text("Die Fünf Fritzen"),
                      onTap: () {}),
                  ListTile(
                      leading: Icon(Icons.group_rounded,
                          color: Theme.of(context).accentColor),
                      title: Text("Leipziger Banausen"),
                      onTap: () {}),
                  ListTile(
                      leading: Icon(Icons.add_rounded,
                          color: Theme.of(context).focusColor),
                      title: Text("Gruppe hinzufügen"),
                      onTap: () {}),
                ],
              ),
            ),
            Divider(),
            ListTile(
                leading: Icon(Icons.settings_rounded,
                    color: Theme.of(context).accentColor),
                title: Text("Einstellungen"),
                onTap: () {}),
          ],
        )),
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
              icon: Icon(Icons.home_rounded),
              label: "Haushalt",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.event_rounded),
              label: "Wochenplan",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.kitchen_rounded),
              label: "Kühlschrank",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_rounded),
              label: "Einkaufsliste",
            ),
            /*
            BottomNavigationBarItem(
              icon: Icon(
                AppIcons.recipes,
                size: 40,
              ),
              label: "Rezepte",
            ),
            */
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).focusColor,
          child: Icon(Icons.restaurant_rounded),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return Recipes();
              },
            );
          },
        ),
      ),
    );
  }
}
