import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:meal_manager/pages/_profile.dart';
import 'package:provider/provider.dart';

import '.themes.dart';
import '.utilities.dart';
import 'fire.dart';
import 'pages/_settings.dart';
import 'pages/_signIn.dart';
import 'provider.dart';

import 'pages/shopping.dart';
import 'pages/fridge.dart';
import 'pages/recipes.dart';
import 'pages/week.dart';
import 'pages/home.dart';

Future<void> main() async {
  /// Lässt die App mit Firebase kommunizieren
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  /// Startet die Anwendung bzw. MyApp()
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// Weist der App mehrere Provider zu.
    /// Provider sind Klassen, die sich von quasi überall ausführen lassen.
    /// Sie können Dinge verändern, die sonst nicht in Verbindung stehen.
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GroupProvider()),
        Provider<AuthenticationService>(
            create: (_) => AuthenticationService(FirebaseAuth.instance)),
        StreamProvider(
            create: (context) =>
                context.read<AuthenticationService>().authStateChanges,
            initialData: null)
      ],

      /// Statt direkt Main() zu starten, wird hier zuerst auf den
      /// themeHandler [.themes.dart] verwiesen, der das Light- und
      /// Dark-Theme regelt. Dieser wiederum startet dann Main().
      child: themeHandler(context),
    );
  }
}

class UserCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    return firebaseUser == null ? SignIn() : Main();
  }
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();

  /// Startet neuen State des Widgets.
}

class _MainState extends State<Main> {
  /// Setzt Start-Index der unteren NavigationBar
  int currentIndex = 0;

  /// Gruppen-Namen zum Testen. Später dann aus Datenbank
  List groups = ["Die Fünf Fritzen", "Leipziger Banausen"];

  @override
  Widget build(BuildContext context) {
    /// Scaffold = Grundgerüst einer App bzw. App-Seite
    return Scaffold(
      //
      appBar: AppBar(
        leading: Builder(

            /// Builder erzeugt IconButton, der den Drawer öffnet
            builder: (context) => IconButton(
                icon: Icon(Icons.menu_rounded, size: 32),
                onPressed: () => Scaffold.of(context).openDrawer())),

        /// Title-Text von Provider "GroupProvider" [provider.dart]
        title: Text(Provider.of<GroupProvider>(context).groupName),
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
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()))),
          ),
        ],
      ),
      //
      body: [Home(), Week(), Fridge(), Shopping()][currentIndex],
      //
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
                decoration: BoxDecoration(color: Theme.of(context).focusColor),
                child: Container(
                  width: double.infinity,
                  child: Text("Banner \nmit Logo",
                      style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).primaryColor)),
                )),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                physics: BouncingScrollPhysics(),
                itemCount: groups.length + 1,
                itemBuilder: (context, index) {
                  return index < groups.length
                      ? ListTile(
                          leading: Icon(Icons.group_rounded,
                              color: Theme.of(context).accentColor),
                          title: Text(groups[index]),
                          onTap: () {
                            Navigator.pop(context);
                            Provider.of<GroupProvider>(context, listen: false)
                                .changeGroup(groups[index]);
                          })
                      : ListTile(
                          leading: Icon(Icons.add_rounded,
                              color: Theme.of(context).accentColor),
                          title: Text("Gruppe hinzufügen"),
                          onTap: () => showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text("Was tun?",
                                  style: Theme.of(context).textTheme.headline3),
                              content: Text(
                                  "Möchtest du einer Gruppe beitreten oder eine neue erstellen?"),
                              actions: [
                                TextButton(
                                    onPressed: () {}, child: Text("Beitreten")),
                                TextButton(
                                    onPressed: () {},
                                    child: Text("Neu erstellen"))
                              ],
                            ),
                          ),
                        );
                },
              ),
            ),
            Divider(),
            ListTile(
                leading: Icon(Icons.settings_rounded,
                    color: Theme.of(context).accentColor),
                title: Text("Einstellungen"),
                onTap: () => Navigator.push(
                    context, CustomPageRoute(child: Settings()))),
          ],
        ),
      ),
      //
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
        ],
      ),
      //
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).focusColor,
        child: Icon(Icons.restaurant_rounded),
        onPressed: () {
          Navigator.push(
              context, CupertinoPageRoute(builder: (context) => Recipes()));
        },
      ),
    );
  }
}
