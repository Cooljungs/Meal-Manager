import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:meal_manager/utils/avatars.dart';
import 'package:provider/provider.dart';

import 'package:meal_manager/config/themes/theme_config.dart';
import 'package:meal_manager/constants/asset_path.dart';
import 'package:meal_manager/core/auth/auth_service.dart';
import 'package:meal_manager/core/login/sign_in.dart';

import 'package:meal_manager/screens/main_screens/shopping.dart';
import 'package:meal_manager/screens/main_screens/fridge.dart';
import 'package:meal_manager/screens/main_screens/recipes.dart';
import 'package:meal_manager/screens/main_screens/week.dart';
import 'package:meal_manager/screens/main_screens/home.dart';

import 'package:meal_manager/screens/sub_screens/profile.dart';
import 'package:meal_manager/screens/sub_screens/settings.dart';

import 'package:meal_manager/utils/animations.dart';
import 'package:meal_manager/utils/providers.dart';

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
                child: avatarPainter(context, 36),
                onTap: () => Navigator.push(context,
                    Teleport(child: Profile(), type: "scale_topRight"))),
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
                decoration: BoxDecoration(color: Theme.of(context).accentColor),
                child: Container(
                  width: double.infinity,
                  child: Text("Banner \nmit Logo",
                      style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.onSecondary)),
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
                              color: Theme.of(context).colorScheme.onPrimary),
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
                    color: Theme.of(context).colorScheme.onPrimary),
                title: Text("Einstellungen"),
                onTap: () => Navigator.push(context,
                    Teleport(child: Settings(), type: "scale_bottomLeft"))),
          ],
        ),
      ),
      //
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Theme.of(context).colorScheme.onPrimary,
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
            tooltip: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_rounded),
            label: "Wochenplan",
            tooltip: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.kitchen_rounded),
            label: "Kühlschrank",
            tooltip: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_rounded),
            label: "Einkaufsliste",
            tooltip: "",
          ),
        ],
      ),
      //
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: Icon(Icons.restaurant_rounded),
        onPressed: () {
          Navigator.push(
              context, Teleport(child: Recipes(), type: "scale_bottomRight"));
        },
      ),
    );
  }
}
